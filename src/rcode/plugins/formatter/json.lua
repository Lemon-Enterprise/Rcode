--[[
Json Plugin
Rcode plugin for Json
]]

local Plugin = require("rcode.core.plugin")

local JsonPlugin = Plugin:extend("Rcode.Plugins.Json")

function JsonPlugin:init()
  self:super()
  self.name = "Json"
  self.description = "Json"
  self.version = "1.0.0"
end

function JsonPlugin:activate()
  -- Plugin activation logic
end

function JsonPlugin:deactivate()
  -- Plugin deactivation logic
end

function JsonPlugin:provide()
  return {
    capabilities = {
      -- Plugin capabilities
    },
    commands = {
      -- Plugin commands
    }
  }
end

return JsonPlugin
