--[[
Mock Plugin
]]

local MockPlugin = {}

function MockPlugin:new()
  return { name = "mock", activated = false }
end

function MockPlugin:activate()
  self.activated = true
end

return MockPlugin
