--[[
Rename Plugin
]]

local Plugin = require("rcode.core.plugin")

local RenamePlugin = Plugin:extend("Rcode.Plugins.Rename")

function RenamePlugin:init()
  self:super()
  self.name = "rename"
end

return RenamePlugin
