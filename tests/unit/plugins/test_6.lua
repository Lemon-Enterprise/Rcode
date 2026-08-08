--[[
Test 6 for plugins
]]

local Test = require("rcode.tests.framework")

local PluginsTest6 = Test:extend("Rcode.Tests.Plugins6")

function PluginsTest6:test_something()
  self:assert(true, "Test should pass")
end

return PluginsTest6
