--[[
Type Definition Plugin
]]

local Plugin = require("rcode.core.plugin")

local Type_definitionPlugin = Plugin:extend("Rcode.Plugins.Type_definition")

function Type_definitionPlugin:init()
  self:super()
  self.name = "type_definition"
end

return Type_definitionPlugin
