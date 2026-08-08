--[[
Base Plugin
Rcode plugin for Base
]]

local Plugin = require("rcode.core.plugin")

local BasePlugin = Plugin:extend("Rcode.Plugins.Base")

function BasePlugin:init()
  self:super()
  self.name = "Base"
  self.description = "Base"
  self.version = "1.0.0"
end

function BasePlugin:activate()
  -- Plugin activation logic
end

function BasePlugin:deactivate()
  -- Plugin deactivation logic
end

function BasePlugin:provide()
  return {
    capabilities = {
      -- Plugin capabilities
    },
    commands = {
      -- Plugin commands
    }
  }
end

return BasePlugin
