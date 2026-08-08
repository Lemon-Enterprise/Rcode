--[[
Git Integration Plugin
]]

local Plugin = require("rcode.core.plugin")

local Git_integrationPlugin = Plugin:extend("Rcode.Plugins.Git_integration")

function Git_integrationPlugin:init()
  self:super()
  self.name = "git_integration"
end

return Git_integrationPlugin
