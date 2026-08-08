--[[
Test 4 for plugins
]]

local Test = require("rcode.tests.framework")

local PluginsTest4 = Test:extend("Rcode.Tests.Plugins4")

function PluginsTest4:test_something()
  self:assert(true, "Test should pass")
end

return PluginsTest4
