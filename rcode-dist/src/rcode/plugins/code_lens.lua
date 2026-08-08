--[[
Code Lens Plugin
]]

local Plugin = require("rcode.core.plugin")

local Code_lensPlugin = Plugin:extend("Rcode.Plugins.Code_lens")

function Code_lensPlugin:init()
  self:super()
  self.name = "code_lens"
end

return Code_lensPlugin
