--[[
Error Lens Plugin
]]

local Plugin = require("rcode.core.plugin")

local Error_lensPlugin = Plugin:extend("Rcode.Plugins.Error_lens")

function Error_lensPlugin:init()
  self:super()
  self.name = "error_lens"
end

return Error_lensPlugin
