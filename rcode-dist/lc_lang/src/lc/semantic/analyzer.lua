local Scope = require("lc.semantic.scope")
local Analyzer = {}
local function walk(node, scope, errors)
  if node.kind == "Program" then for _, child in ipairs(node.body) do walk(child, scope, errors) end
  elseif node.kind == "Function" or node.kind == "Class" or node.kind == "Enum" then
    if scope:lookup(node.name) then errors[#errors + 1] = "duplicate declaration: " .. node.name else scope:define(node.name, node) end
    local child = Scope.new(scope); for _, parameter in ipairs(node.parameters or {}) do child:define(parameter.name, parameter) end; for _, statement in ipairs(node.body or {}) do walk(statement, child, errors) end
  elseif node.kind == "Let" then if scope:lookup(node.name) then errors[#errors + 1] = "duplicate variable: " .. node.name else scope:define(node.name, node) end
  elseif node.kind == "If" then for _, branch in ipairs(node.branches) do for _, statement in ipairs(branch.body) do walk(statement, Scope.new(scope), errors) end end
  end
end
function Analyzer.analyze(program) local errors = {}; walk(program, Scope.new(), errors); return { ok = #errors == 0, errors = errors } end
return Analyzer
