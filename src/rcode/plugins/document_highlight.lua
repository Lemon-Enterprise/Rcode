--[[
Document Highlight Plugin
]]

local Plugin = require("rcode.core.plugin")

local Document_highlightPlugin = Plugin:extend("Rcode.Plugins.Document_highlight")

function Document_highlightPlugin:init()
  self:super()
  self.name = "document_highlight"
end

return Document_highlightPlugin
