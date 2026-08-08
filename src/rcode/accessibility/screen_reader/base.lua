--[[
Screen Reader Base
]]

local ScreenReader = {}

function ScreenReader:new()
  return setmetatable({}, {__index = ScreenReader})
end

return ScreenReader
