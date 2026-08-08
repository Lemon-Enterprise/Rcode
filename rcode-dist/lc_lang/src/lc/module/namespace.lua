local Namespace = {}
function Namespace.split(name) local values = {}; for part in name:gmatch("[^:]+") do values[#values + 1] = part end; return values end
function Namespace.join(parts) return table.concat(parts, "::") end
return Namespace
