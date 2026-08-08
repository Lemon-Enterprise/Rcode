local Constraints = {}
function Constraints.check(annotation, value) return annotation == nil or value ~= nil end
return Constraints
