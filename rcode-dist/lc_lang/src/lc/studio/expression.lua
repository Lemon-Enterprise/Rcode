local Expression = {}
function Expression.format(node)
  if not node then return "" end
  if node.kind == "Literal" then return node.literal_type == "string" and ('"' .. node.value .. '"') or tostring(node.value) end
  if node.kind == "FormatString" then return 'f"' .. node.value .. '"' end
  if node.kind == "Identifier" then return node.name end
  if node.kind == "Namespace" then return Expression.format(node.target) .. "::" .. node.member end
  if node.kind == "Annotated" then return "@[" .. node.annotation .. "]" .. Expression.format(node.value) end
  if node.kind == "Call" then local items = {}; for _, argument in ipairs(node.arguments) do items[#items + 1] = (argument.name and argument.name .. " = " or "") .. Expression.format(argument.value) end; return Expression.format(node.target) .. "(" .. table.concat(items, ", ") .. ")" end
  return "<" .. node.kind .. ">"
end
return Expression
