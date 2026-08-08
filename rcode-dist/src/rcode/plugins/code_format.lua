--[[
Code Format Plugin
]]

local Plugin = require("rcode.core.plugin")

local Code_formatPlugin = Plugin:extend("Rcode.Plugins.Code_format")

function Code_formatPlugin:init()
  self:super()
  self.name = "code_format"
end

return Code_formatPlugin
