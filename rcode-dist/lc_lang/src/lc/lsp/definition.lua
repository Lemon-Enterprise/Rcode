local Definition = {}
function Definition.find(program, name) for _, node in ipairs(program.body) do if node.name == name then return node end end end
return Definition
