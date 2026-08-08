--[[
Terminal Integration Plugin
]]

local Plugin = require("rcode.core.plugin")

local Terminal_integrationPlugin = Plugin:extend("Rcode.Plugins.Terminal_integration")

function Terminal_integrationPlugin:init()
  self:super()
  self.name = "terminal_integration"
end

return Terminal_integrationPlugin
