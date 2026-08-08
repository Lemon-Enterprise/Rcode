--[[
Server Plugin
Rcode plugin for Server
]]

local Plugin = require("rcode.core.plugin")

local ServerPlugin = Plugin:extend("Rcode.Plugins.Server")

function ServerPlugin:init()
  self:super()
  self.name = "Server"
  self.description = "Server"
  self.version = "1.0.0"
end

function ServerPlugin:activate()
  -- Plugin activation logic
end

function ServerPlugin:deactivate()
  -- Plugin deactivation logic
end

function ServerPlugin:provide()
  return {
    capabilities = {
      -- Plugin capabilities
    },
    commands = {
      -- Plugin commands
    }
  }
end

return ServerPlugin
