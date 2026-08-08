--[[
Metrics Collector
]]

local Collector = {}

function Collector:new()
  return setmetatable({ metrics = {} }, {__index = Collector})
end

function Collector:record(name, value)
  -- Record metric
end

return Collector
