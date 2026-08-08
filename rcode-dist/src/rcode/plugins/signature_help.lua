--[[
Signature Help Plugin
]]

local Plugin = require("rcode.core.plugin")

local Signature_helpPlugin = Plugin:extend("Rcode.Plugins.Signature_help")

function Signature_helpPlugin:init()
  self:super()
  self.name = "signature_help"
end

return Signature_helpPlugin
