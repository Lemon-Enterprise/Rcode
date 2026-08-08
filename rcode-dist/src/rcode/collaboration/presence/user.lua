--[[
User Presence
]]

local User = {}

function User:new(id, name)
  return { id = id, name = name, online = true }
end

return User
