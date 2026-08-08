--[[
Test 2 for plugins
]]

local Test = require("rcode.tests.framework")

local PluginsTest2 = Test:extend("Rcode.Tests.Plugins2")

function PluginsTest2:test_something()
  self:assert(true, "Test should pass")
end

return PluginsTest2
