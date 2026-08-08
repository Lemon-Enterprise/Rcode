--[[
Test 6 for utils
]]

local Test = require("rcode.tests.framework")

local UtilsTest6 = Test:extend("Rcode.Tests.Utils6")

function UtilsTest6:test_something()
  self:assert(true, "Test should pass")
end

return UtilsTest6
