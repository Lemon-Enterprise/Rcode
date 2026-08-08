--[[
Test 5 for config
]]

local Test = require("rcode.tests.framework")

local ConfigTest5 = Test:extend("Rcode.Tests.Config5")

function ConfigTest5:test_something()
  self:assert(true, "Test should pass")
end

return ConfigTest5
