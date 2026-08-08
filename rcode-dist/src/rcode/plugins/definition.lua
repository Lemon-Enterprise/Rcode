--[[
Definition Plugin
]]

local Plugin = require("rcode.core.plugin")

local DefinitionPlugin = Plugin:extend("Rcode.Plugins.Definition")

function DefinitionPlugin:init()
  self:super()
  self.name = "definition"
end

return DefinitionPlugin
