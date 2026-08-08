--[[
Search Plugin
]]

local Plugin = require("rcode.core.plugin")

local SearchPlugin = Plugin:extend("Rcode.Plugins.Search")

function SearchPlugin:init()
  self:super()
  self.name = "search"
end

return SearchPlugin
