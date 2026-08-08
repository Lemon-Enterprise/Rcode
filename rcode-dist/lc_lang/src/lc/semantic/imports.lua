local Imports = {}
function Imports.collect(program) local values = {}; for _, node in ipairs(program.body) do if node.kind == "Import" then values[#values + 1] = node.path end end; return values end
return Imports
