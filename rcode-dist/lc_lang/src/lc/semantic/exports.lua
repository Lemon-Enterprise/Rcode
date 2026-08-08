local Exports = {}
function Exports.collect(program) local values = {}; for _, node in ipairs(program.body) do if node.kind == "Export" then values[#values + 1] = node.name end end; return values end
return Exports
