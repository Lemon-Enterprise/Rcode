--[[
Workspace Symbol Plugin
]]

local Plugin = require("rcode.core.plugin")

local Workspace_symbolPlugin = Plugin:extend("Rcode.Plugins.Workspace_symbol")

function Workspace_symbolPlugin:init()
  self:super()
  self.name = "workspace_symbol"
end

return Workspace_symbolPlugin
