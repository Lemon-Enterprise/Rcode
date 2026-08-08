local Meter = {}; Meter.__index = Meter
function Meter.new() return setmetatable({ values = {} }, Meter) end
function Meter:add(name, value) self.values[name] = (self.values[name] or 0) + (value or 1) end
return Meter
