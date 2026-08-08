--[[
Test Framework Base
]]

local Framework = {}

function Framework:new()
  return setmetatable({}, {__index = Framework})
end

function Framework:assert(condition, message)
  if not condition then
    error(message or "Assertion failed")
  end
end

return Framework
