--[[
Test 4 for config
]]

local Test = require("rcode.tests.framework")

local ConfigTest4 = Test:extend("Rcode.Tests.Config4")

function ConfigTest4:test_something()
  self:assert(true, "Test should pass")
end

return ConfigTest4
