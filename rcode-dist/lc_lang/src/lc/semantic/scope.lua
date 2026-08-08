local Scope = {}; Scope.__index = Scope
function Scope.new(parent) return setmetatable({ parent = parent, values = {} }, Scope) end
function Scope:define(name, value) self.values[name] = value end
function Scope:lookup(name) if self.values[name] ~= nil then return self.values[name] end; return self.parent and self.parent:lookup(name) or nil end
return Scope
