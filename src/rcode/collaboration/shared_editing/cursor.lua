--[[
Shared Cursor
]]

local Cursor = {}

function Cursor:new(user, position)
  return { user = user, position = position }
end

return Cursor
