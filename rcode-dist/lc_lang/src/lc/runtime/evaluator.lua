local Environment, Builtins = require("lc.runtime.environment"), require("lc.runtime.builtins")
local Evaluator = {}
local function format(node)
  if node.kind == "Identifier" then return node.name elseif node.kind == "Namespace" then return format(node.target) .. "::" .. node.member elseif node.kind == "Call" then return format(node.target) end
  return node.kind
end
local eval
local function execute(statements, environment)
  local last = nil
  for _, statement in ipairs(statements) do
    if statement.kind == "Let" then last = eval(statement.value, environment); environment:set(statement.name, last)
    elseif statement.kind == "Function" then environment:set(statement.name, { kind = "FunctionValue", node = statement, environment = environment })
    elseif statement.kind == "If" then
      local matched = false; for _, branch in ipairs(statement.branches) do if eval(branch.condition, environment) then last = execute(branch.body, Environment.new(environment)); matched = true; break end end
      if not matched and statement.else_body then last = execute(statement.else_body, Environment.new(environment)) end
    elseif statement.kind == "ExpressionStatement" then last = eval(statement.expression, environment) end
  end
  return last
end
eval = function(node, environment)
  if node.kind == "Literal" then return node.value end
  if node.kind == "FormatString" then return (node.value:gsub("{([%w_]+)}", function(name) return tostring(environment:get(name) or "") end)) end
  if node.kind == "Identifier" then return environment:get(node.name) or { kind = "Symbol", name = node.name } end
  if node.kind == "Annotated" then return eval(node.value, environment) end
  if node.kind == "Unary" then return -eval(node.value, environment) end
  if node.kind == "Binary" then local a, b = eval(node.left, environment), eval(node.right, environment); local ops = { ["+"] = function() return a + b end, ["-"] = function() return a - b end, ["*"] = function() return a * b end, ["/"] = function() return a / b end, ["=="] = function() return a == b end, ["!="] = function() return a ~= b end, ["<"] = function() return a < b end, [">"] = function() return a > b end, ["<="] = function() return a <= b end, [">="] = function() return a >= b end, ["&&"] = function() return a and b end, ["||"] = function() return a or b end }; return ops[node.operator]() end
  if node.kind == "Constructor" then local properties = {}; for _, argument in ipairs(node.arguments) do properties[argument.name or ("arg" .. #properties)] = eval(argument.value, environment) end; return { kind = "Widget", widget_type = node.name, properties = properties } end
  if node.kind == "Call" then local args = {}; for _, argument in ipairs(node.arguments) do args[#args + 1] = eval(argument.value, environment) end; local value = node.target.kind == "Identifier" and environment:get(node.target.name) or nil; if type(value) == "table" and value.kind == "FunctionValue" then local local_env = Environment.new(value.environment); for index, parameter in ipairs(value.node.parameters) do local_env:set(parameter.name, args[index] or (parameter.value and eval(parameter.value, local_env))) end; return execute(value.node.body, local_env) end; return Builtins.invoke(format(node.target), args) end
  return nil
end
function Evaluator.run(program) return execute(program.body, Environment.new()) end
return Evaluator
