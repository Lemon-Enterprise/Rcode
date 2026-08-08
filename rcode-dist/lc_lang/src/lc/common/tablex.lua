local Tablex = {}
function Tablex.copy(value) local out = {}; for k, v in pairs(value) do out[k] = v end; return out end
function Tablex.push(list, value) list[#list + 1] = value; return value end
return Tablex
