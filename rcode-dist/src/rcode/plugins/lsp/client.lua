--[[
Client Plugin
Rcode plugin for Client
]]

local Plugin = require("rcode.core.plugin")

local ClientPlugin = Plugin:extend("Rcode.Plugins.Client")

function ClientPlugin:init()
  self:super()
  self.name = "Client"
  self.description = "Client"
  self.version = "1.0.0"
end

function ClientPlugin:activate()
  -- Plugin activation logic
end

function ClientPlugin:deactivate()
  -- Plugin deactivation logic
end

function ClientPlugin:provide()
  return {
    capabilities = {
      -- Plugin capabilities
    },
    commands = {
      -- Plugin commands
    }
  }
end

return ClientPlugin
