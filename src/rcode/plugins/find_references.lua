--[[
Find References Plugin
]]

local Plugin = require("rcode.core.plugin")

local Find_referencesPlugin = Plugin:extend("Rcode.Plugins.Find_references")

function Find_referencesPlugin:init()
  self:super()
  self.name = "find_references"
end

return Find_referencesPlugin
