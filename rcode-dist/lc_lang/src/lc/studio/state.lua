local State = {}; State.__index = State
function State.new(values) return setmetatable({ values = values or {} }, State) end
function State:get(name) return self.values[name] end
function State:set(name, value) self.values[name] = value end
return State
