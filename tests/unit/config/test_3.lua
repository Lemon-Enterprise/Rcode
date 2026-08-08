--[[
Test 3 for config
]]

local Test = require("rcode.tests.framework")

local ConfigTest3 = Test:extend("Rcode.Tests.Config3")

function ConfigTest3:test_something()
  self:assert(true, "Test should pass")
end

return ConfigTest3
