local Expression = require("lc.studio.expression")
local Manifest = {}
local function static(node)
  if node.kind == "Annotated" then return static(node.value) end
  if node.kind == "Literal" then return node.value end
  if node.kind == "Call" and Expression.format(node.target) == "Hex::new" then return { color = static(node.arguments[1].value) } end
  return Expression.format(node)
end
local function widgets(body)
  local output = {}
  for _, statement in ipairs(body) do if statement.kind == "Function" and statement.generic == "LSWidget" then
    local nodes = {}; for _, nested in ipairs(statement.body) do if nested.kind == "ExpressionStatement" and nested.expression.kind == "Call" and nested.expression.target.name == "LSWidget" then local lambda = nested.expression.arguments[1].value; for _, item in ipairs(lambda.body) do if item.kind == "Let" and item.value.kind == "Constructor" then local properties = {}; for _, argument in ipairs(item.value.arguments) do properties[argument.name] = static(argument.value) end; nodes[#nodes + 1] = { id = item.name, type = item.value.name, properties = properties } end end end end
    output[#output + 1] = { ["function"] = statement.name, element = statement.parameters[1] and statement.parameters[1].name or nil, nodes = nodes }
  end end
  return output
end
function Manifest.from_program(program)
  local app, imports = nil, {}; for _, node in ipairs(program.body) do if node.kind == "Import" then imports[#imports + 1] = node.path elseif node.kind == "Function" and node.name == "app" and node.generic == "LSApp" then app = node end end
  if not app then return nil end
  local properties = {}; for _, parameter in ipairs(app.parameters) do properties[parameter.name] = parameter.value and static(parameter.value) or nil end
  return { language = "LC-lang", kind = "Lemon Studio application", imports = imports, app = properties, target = Expression.format(app.return_type), widgets = widgets(app.body) }
end
return Manifest
