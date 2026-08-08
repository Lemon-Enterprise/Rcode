local Tree = {}
function Tree.walk(node, visit) visit(node); for _, child in ipairs(node.children or {}) do Tree.walk(child, visit) end end
return Tree
