--[[
Test 2 for config
]]

local Test = require("rcode.tests.framework")

local ConfigTest2 = Test:extend("Rcode.Tests.Config2")

function ConfigTest2:test_something()
  self:assert(true, "Test should pass")
end

return ConfigTest2
