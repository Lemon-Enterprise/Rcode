--[[
Lc_lang Plugin
Rcode plugin for Lc Lang
]]

local Plugin = require("rcode.core.plugin")

local Lc_langPlugin = Plugin:extend("Rcode.Plugins.Lc_lang")

function Lc_langPlugin:init()
  self:super()
  self.name = "Lc_lang"
  self.description = "Lc Lang"
  self.version = "1.0.0"
end

function Lc_langPlugin:activate()
  -- Plugin activation logic
end

function Lc_langPlugin:deactivate()
  -- Plugin deactivation logic
end

function Lc_langPlugin:provide()
  return {
    capabilities = {
      -- Plugin capabilities
    },
    commands = {
      -- Plugin commands
    }
  }
end

return Lc_langPlugin
