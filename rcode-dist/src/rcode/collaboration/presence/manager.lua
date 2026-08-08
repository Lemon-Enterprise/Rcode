--[[
Presence Manager
]]

local Manager = {}

function Manager:new()
  return setmetatable({ users = {} }, {__index = Manager})
end

return Manager
