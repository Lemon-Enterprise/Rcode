local Environment = {}; Environment.__index = Environment
function Environment.new(parent) return setmetatable({ parent = parent, values = {} }, Environment) end
function Environment:set(name, value) self.values[name] = value end
function Environment:get(name) if self.values[name] ~= nil then return self.values[name] end; return self.parent and self.parent:get(name) end
return Environment
