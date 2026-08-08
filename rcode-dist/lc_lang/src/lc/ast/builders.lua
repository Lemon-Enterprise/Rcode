local Node = require("lc.ast.node")
local Builders = {}
function Builders.make(kind) return function(fields) return Node.new(kind, fields) end end
return Builders
