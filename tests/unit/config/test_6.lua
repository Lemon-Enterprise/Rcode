--[[
Test 6 for config
]]

local Test = require("rcode.tests.framework")

local ConfigTest6 = Test:extend("Rcode.Tests.Config6")

function ConfigTest6:test_something()
  self:assert(true, "Test should pass")
end

return ConfigTest6
