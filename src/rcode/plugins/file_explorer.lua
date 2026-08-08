--[[
File Explorer Plugin
]]

local Plugin = require("rcode.core.plugin")

local File_explorerPlugin = Plugin:extend("Rcode.Plugins.File_explorer")

function File_explorerPlugin:init()
  self:super()
  self.name = "file_explorer"
end

return File_explorerPlugin
