local Reader, Token, Kinds = require("lc.lexer.reader"), require("lc.lexer.token"), require("lc.lexer.token_kinds")
local Keywords = require("lc.lexer.keywords")
local Lexer = {}
local pairs2 = { ["::"] = true, ["->"] = true, ["||"] = true, ["&&"] = true, ["=="] = true, ["!="] = true, ["<="] = true, [">="] = true }
local singles = { ["@"] = true, ["<"] = true, [">"] = true, ["("] = true, [")"] = true, ["{"] = true, ["}"] = true, ["["] = true, ["]"] = true, [","] = true, [":"] = true, ["="] = true, ["."] = true, ["+"] = true, ["-"] = true, ["*"] = true, ["/"] = true, ["|"] = true, ["!"] = true, [";"] = true }
local function add(list, kind, text, value, line, column) list[#list + 1] = Token.new(kind, text, value, line, column) end
local function word_start(char) return char:match("[%a_]") ~= nil end
local function word_part(char) return char:match("[%w_]") ~= nil end
function Lexer.scan(text)
  local reader, tokens = Reader.new(text), {}
  while not reader:eof() do
    local char = reader:peek()
    if char == "\r" then reader:take()
    elseif char == "\n" then add(tokens, Kinds.newline, "\n", nil, reader.line, reader.column); reader:take()
    elseif char:match("%s") then reader:take()
    elseif char == "-" and reader:peek(1) == "-" then while not reader:eof() and reader:peek() ~= "\n" do reader:take() end
    else
      local line, column = reader.line, reader.column
      local format = char == "f" and reader:peek(1) == '"'
      if char == '"' or format then
        if format then reader:take() end; reader:take(); local value, closed = {}, false
        while not reader:eof() do local next_char = reader:take(); if next_char == '"' then closed = true; break end; if next_char == "\\" then local escape = reader:take(); value[#value + 1] = ({ n = "\n", t = "\t", ['"'] = '"', ["\\"] = "\\" })[escape] or escape else value[#value + 1] = next_char end end
        if not closed then error(string.format("LC-lang syntax error at %d:%d: unterminated string", line, column)) end
        add(tokens, format and Kinds.format_string or Kinds.string, table.concat(value), table.concat(value), line, column)
      elseif char == "v" and reader.text:sub(reader.index):match("^v%d+%.%d+%.?%d*") then
        local value = reader.text:sub(reader.index):match("^v%d+%.%d+%.?%d*"); for _ = 1, #value do reader:take() end; add(tokens, Kinds.version, value, value, line, column)
      elseif char:match("%d") then
        local value = reader.text:sub(reader.index):match("^%d+%.?%d*"); for _ = 1, #value do reader:take() end; add(tokens, Kinds.number, value, tonumber(value), line, column)
      elseif word_start(char) then
        local value = {}; while not reader:eof() and word_part(reader:peek()) do value[#value + 1] = reader:take() end; value = table.concat(value); add(tokens, Keywords[value] and Kinds.keyword or Kinds.identifier, value, value, line, column)
      else
        local double = char .. reader:peek(1)
        if pairs2[double] then reader:take(); reader:take(); add(tokens, Kinds.symbol, double, double, line, column)
        elseif singles[char] then reader:take(); add(tokens, Kinds.symbol, char, char, line, column)
        else error(string.format("LC-lang syntax error at %d:%d: unexpected character '%s'", line, column, char)) end
      end
    end
  end
  add(tokens, Kinds.eof, "", nil, reader.line, reader.column); return tokens
end
return Lexer
