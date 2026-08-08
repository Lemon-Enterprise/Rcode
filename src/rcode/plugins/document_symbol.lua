--[[
Document Symbol Plugin
]]

local Plugin = require("rcode.core.plugin")

local Document_symbolPlugin = Plugin:extend("Rcode.Plugins.Document_symbol")

function Document_symbolPlugin:init()
  self:super()
  self.name = "document_symbol"
end

return Document_symbolPlugin
