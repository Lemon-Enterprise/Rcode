--[[
Test 1 for plugins
]]

local Test = require("rcode.tests.framework")

local PluginsTest1 = Test:extend("Rcode.Tests.Plugins1")

function PluginsTest1:test_something()
  self:assert(true, "Test should pass")
end

return PluginsTest1
