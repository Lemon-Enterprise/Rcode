--[[
Test 3 for plugins
]]

local Test = require("rcode.tests.framework")

local PluginsTest3 = Test:extend("Rcode.Tests.Plugins3")

function PluginsTest3:test_something()
  self:assert(true, "Test should pass")
end

return PluginsTest3
