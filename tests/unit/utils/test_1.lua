--[[
Test 1 for utils
]]

local Test = require("rcode.tests.framework")

local UtilsTest1 = Test:extend("Rcode.Tests.Utils1")

function UtilsTest1:test_something()
  self:assert(true, "Test should pass")
end

return UtilsTest1
