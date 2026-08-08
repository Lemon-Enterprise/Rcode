--[[
Shared Editing Manager
]]

local Manager = {}

function Manager:new()
  return setmetatable({ sessions = {} }, {__index = Manager})
end

return Manager
