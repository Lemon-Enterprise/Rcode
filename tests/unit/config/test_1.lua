--[[
Test 1 for config
]]

local Test = require("rcode.tests.framework")

local ConfigTest1 = Test:extend("Rcode.Tests.Config1")

function ConfigTest1:test_something()
  self:assert(true, "Test should pass")
end

return ConfigTest1
