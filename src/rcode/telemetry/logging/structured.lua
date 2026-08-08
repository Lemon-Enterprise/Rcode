--[[
Structured Logging
]]

local Logging = {}

function Logging:new()
  return setmetatable({}, {__index = Logging})
end

function Logging:log(level, message, context)
  -- Log with context
end

return Logging
