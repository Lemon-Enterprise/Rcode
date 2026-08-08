--[[
Sandbox Environment
]]

local Environment = {}

function Environment:new()
  return setmetatable({ safe = true }, {__index = Environment})
end

return Environment
