--[[
Autocomplete Plugin
]]

local Plugin = require("rcode.core.plugin")

local AutocompletePlugin = Plugin:extend("Rcode.Plugins.Autocomplete")

function AutocompletePlugin:init()
  self:super()
  self.name = "autocomplete"
end

return AutocompletePlugin
