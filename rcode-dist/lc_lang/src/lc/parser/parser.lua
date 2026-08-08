local Lexer, Kinds, Node, Precedence = require("lc.lexer.lexer"), require("lc.lexer.token_kinds"), require("lc.ast.node"), require("lc.parser.precedence")
local Parser = {}; Parser.__index = Parser
function Parser.new(tokens) return setmetatable({ tokens = tokens, index = 1 }, Parser) end
function Parser.current(self) return self.tokens[self.index] end
function Parser.look(self, offset) return self.tokens[math.min(self.index + (offset or 1), #self.tokens)] end
function Parser.test(self, kind, text) local token = self:current(); return token.kind == kind and (text == nil or token.text == text) end
function Parser.match(self, kind, text) if self:test(kind, text) then self.index = self.index + 1; return true end return false end
function Parser.expect(self, kind, text)
  local token = self:current(); if not self:match(kind, text) then error(string.format("LC-lang syntax error at %d:%d: expected %s, found '%s'", token.line, token.column, text or kind, token.text)) end; return token
end
function Parser:skip_lines() while self:match(Kinds.newline) do end end
function Parser:name(label) local token = self:current(); if token.kind ~= Kinds.identifier and token.kind ~= Kinds.keyword then error(string.format("LC-lang syntax error at %d:%d: expected %s", token.line, token.column, label or "name")) end; self.index = self.index + 1; return token.text end
function Parser:program()
  local body = {}; self:skip_lines(); while not self:test(Kinds.eof) do body[#body + 1] = self:statement(); self:skip_lines() end; return Node.new("Program", { body = body })
end
function Parser:statement()
  local token, next_token = self:current(), self:look()
  if token.text == "@" and next_token.text == "import" then return self:import_statement() end
  if token.text == "@" and next_token.text == "export" then return self:export_statement() end
  if token.text == "pub" or token.text == "local" or token.text == "fn" then return self:function_declaration() end
  if token.text == "let" then return self:let_statement() end
  if token.text == "if" then return self:if_statement() end
  if token.text == "class" or token.text == "enum" or token.text == "impl" then return self:named_block() end
  return Node.new("ExpressionStatement", { expression = self:expression() })
end
function Parser:import_statement()
  self:expect(Kinds.symbol, "@"); self:expect(Kinds.keyword, "import"); self:expect(Kinds.symbol, "<"); local parts = {}
  while not self:test(Kinds.symbol, ">") do local token = self:current(); if token.kind == Kinds.eof or token.kind == Kinds.newline then error("LC-lang syntax error: unterminated import") end; parts[#parts + 1] = token.text; self.index = self.index + 1 end
  self:expect(Kinds.symbol, ">"); return Node.new("Import", { path = table.concat(parts) })
end
function Parser:export_statement() self:expect(Kinds.symbol, "@"); self:expect(Kinds.keyword, "export"); return Node.new("Export", { name = self:name("exported name") }) end
function Parser:generic() if not self:match(Kinds.symbol, "<") then return nil end; local value = self:name("generic type"); self:expect(Kinds.symbol, ">"); return value end
function Parser:parameters()
  self:expect(Kinds.symbol, "("); self:skip_lines(); local parameters = {}
  while not self:test(Kinds.symbol, ")") do
    local is_let = self:match(Kinds.keyword, "let"); local name = self:name("parameter name"); local value = nil; if self:match(Kinds.symbol, "=") then value = self:expression() end
    parameters[#parameters + 1] = Node.new("Parameter", { name = name, is_let = is_let, value = value })
    local comma = self:match(Kinds.symbol, ","); local had_line = self:test(Kinds.newline); self:skip_lines(); if not self:test(Kinds.symbol, ")") and not comma and not had_line then error("LC-lang syntax error: expected parameter separator") end
  end
  self:expect(Kinds.symbol, ")"); return parameters
end
function Parser:block()
  self:expect(Kinds.symbol, "{"); self:skip_lines(); local body = {}
  while not self:test(Kinds.symbol, "}") do if self:test(Kinds.eof) then error("LC-lang syntax error: unterminated block") end; body[#body + 1] = self:statement(); self:skip_lines() end
  self:expect(Kinds.symbol, "}"); return body
end
function Parser:function_declaration()
  local visibility = "internal"; if self:match(Kinds.keyword, "pub") then visibility = "public" elseif self:match(Kinds.keyword, "local") then visibility = "local" end
  self:expect(Kinds.keyword, "fn"); local name, generic, parameters = self:name("function name"), self:generic(), self:parameters(); local return_type = nil
  if self:match(Kinds.symbol, "->") then return_type = self:expression() end; self:skip_lines(); return Node.new("Function", { name = name, visibility = visibility, generic = generic, parameters = parameters, return_type = return_type, body = self:block() })
end
function Parser:let_statement() self:expect(Kinds.keyword, "let"); local name = self:name("variable name"); self:expect(Kinds.symbol, "="); return Node.new("Let", { name = name, value = self:expression() }) end
function Parser:if_statement()
  self:expect(Kinds.keyword, "if"); local branches = {}; local condition = self:expression(); self:match(Kinds.keyword, "then"); self:skip_lines(); branches[#branches + 1] = { condition = condition, body = self:block() }; self:skip_lines()
  while self:match(Kinds.keyword, "elif") do local next_condition = self:expression(); self:match(Kinds.keyword, "then"); self:skip_lines(); branches[#branches + 1] = { condition = next_condition, body = self:block() }; self:skip_lines() end
  local else_body = nil; if self:match(Kinds.keyword, "else") then self:skip_lines(); else_body = self:block() end; return Node.new("If", { branches = branches, else_body = else_body })
end
function Parser:named_block()
  local kind = self:current().text; self.index = self.index + 1; local name, generic = self:name(kind .. " name"), self:generic(); self:skip_lines(); return Node.new(kind:sub(1, 1):upper() .. kind:sub(2), { name = name, generic = generic, body = self:block() })
end
function Parser:annotation()
  self:expect(Kinds.symbol, "@"); self:expect(Kinds.symbol, "["); local depth, pieces = 1, {}
  while depth > 0 do local token = self:current(); if token.kind == Kinds.eof then error("LC-lang syntax error: unterminated annotation") end; self.index = self.index + 1; if token.text == "[" then depth = depth + 1 elseif token.text == "]" then depth = depth - 1 else pieces[#pieces + 1] = token.kind == Kinds.format_string and ('f"' .. token.text .. '"') or token.text end end
  return table.concat(pieces, " ")
end
function Parser:call(target)
  self:expect(Kinds.symbol, "("); self:skip_lines(); local arguments = {}
  while not self:test(Kinds.symbol, ")") do
    local name = nil; if (self:current().kind == Kinds.identifier or self:current().kind == Kinds.keyword) and self:look().text == "=" then name = self:current().text; self.index = self.index + 2 end
    arguments[#arguments + 1] = Node.new("Argument", { name = name, value = self:expression() }); local comma = self:match(Kinds.symbol, ","); local had_line = self:test(Kinds.newline); self:skip_lines(); if not self:test(Kinds.symbol, ")") and not comma and not had_line then error("LC-lang syntax error: expected argument separator") end
  end
  self:expect(Kinds.symbol, ")"); return Node.new("Call", { target = target, arguments = arguments })
end
function Parser:primary()
  local token = self:current()
  if self:match(Kinds.symbol, "@") then
    if self:test(Kinds.symbol, "[") then self.index = self.index - 1; local annotation = self:annotation(); return Node.new("Annotated", { annotation = annotation, value = self:expression() }) end
    if self:match(Kinds.keyword, "new") then local name = self:name("constructor name"); local call = self:call(Node.new("Identifier", { name = name })); return Node.new("Constructor", { name = name, arguments = call.arguments }) end
    error("LC-lang syntax error: expected '[' or 'new' after '@'")
  end
  if self:match(Kinds.symbol, "|") then local parameter = self:name("lambda parameter"); self:expect(Kinds.symbol, "|"); self:expect(Kinds.symbol, "->"); self:skip_lines(); return Node.new("Lambda", { parameter = parameter, body = self:block() }) end
  if self:match(Kinds.symbol, "(") then local inside = self:expression(); self:expect(Kinds.symbol, ")"); return inside end
  if self:match(Kinds.symbol, "-") then return Node.new("Unary", { operator = "-", value = self:expression(7) }) end
  self.index = self.index + 1
  if token.kind == Kinds.number or token.kind == Kinds.string or token.kind == Kinds.version then return Node.new("Literal", { value = token.value, literal_type = token.kind }) end
  if token.kind == Kinds.format_string then return Node.new("FormatString", { value = token.value }) end
  if token.kind == Kinds.identifier and (token.text == "True" or token.text == "False") then return Node.new("Literal", { value = token.text == "True", literal_type = "boolean" }) end
  if token.kind == Kinds.identifier or token.kind == Kinds.keyword then return Node.new("Identifier", { name = token.text }) end
  error(string.format("LC-lang syntax error at %d:%d: expected expression", token.line, token.column))
end
function Parser:expression(minimum)
  minimum = minimum or 0; local left = self:primary()
  while true do
    if self:test(Kinds.symbol, "(") then left = self:call(left)
    elseif self:match(Kinds.symbol, "::") then left = Node.new("Namespace", { target = left, member = self:name("namespace member") })
    else local token = self:current(); local precedence = token.kind == Kinds.symbol and Precedence[token.text] or nil; if not precedence or precedence < minimum then break end; self.index = self.index + 1; left = Node.new("Binary", { operator = token.text, left = left, right = self:expression(precedence + 1) }) end
  end
  return left
end
function Parser.parse(text) return Parser.new(Lexer.scan(text)):program() end
return Parser
