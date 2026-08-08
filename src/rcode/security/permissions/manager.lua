--[[
Permissions Manager
]]

local Manager = {}

function Manager:new()
  return setmetatable({ permissions = {} }, {__index = Manager})
end

function Manager:check(resource, action)
  return true
end

return Manager
