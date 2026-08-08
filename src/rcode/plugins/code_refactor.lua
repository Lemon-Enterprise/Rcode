--[[
Code Refactor Plugin
]]

local Plugin = require("rcode.core.plugin")

local Code_refactorPlugin = Plugin:extend("Rcode.Plugins.Code_refactor")

function Code_refactorPlugin:init()
  self:super()
  self.name = "code_refactor"
end

return Code_refactorPlugin
