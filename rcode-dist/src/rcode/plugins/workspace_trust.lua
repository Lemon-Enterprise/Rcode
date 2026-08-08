--[[
Workspace Trust Plugin
]]

local Plugin = require("rcode.core.plugin")

local Workspace_trustPlugin = Plugin:extend("Rcode.Plugins.Workspace_trust")

function Workspace_trustPlugin:init()
  self:super()
  self.name = "workspace_trust"
end

return Workspace_trustPlugin
