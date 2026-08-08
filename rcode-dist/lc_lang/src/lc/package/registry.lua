local Registry = {}; Registry.__index = Registry
function Registry.new() return setmetatable({ entries = {} }, Registry) end
function Registry:add(name, versions) self.entries[name] = versions end
function Registry:find(name) return self.entries[name] end
return Registry
