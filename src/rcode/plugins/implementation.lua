--[[
Implementation Plugin
]]

local Plugin = require("rcode.core.plugin")

local ImplementationPlugin = Plugin:extend("Rcode.Plugins.Implementation")

function ImplementationPlugin:init()
  self:super()
  self.name = "implementation"
end

return ImplementationPlugin
