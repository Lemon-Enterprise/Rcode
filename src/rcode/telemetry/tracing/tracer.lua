--[[
Tracer
]]

local Tracer = {}

function Tracer:new()
  return setmetatable({}, {__index = Tracer})
end

function Tracer:start_span(name)
  -- Start tracing span
end

return Tracer
