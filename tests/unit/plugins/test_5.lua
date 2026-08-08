--[[
Test 5 for plugins
]]

local Test = require("rcode.tests.framework")

local PluginsTest5 = Test:extend("Rcode.Tests.Plugins5")

function PluginsTest5:test_something()
  self:assert(true, "Test should pass")
end

return PluginsTest5
