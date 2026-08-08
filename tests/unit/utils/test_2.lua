--[[
Test 2 for utils
]]

local Test = require("rcode.tests.framework")

local UtilsTest2 = Test:extend("Rcode.Tests.Utils2")

function UtilsTest2:test_something()
  self:assert(true, "Test should pass")
end

return UtilsTest2
