--[[
Test 3 for utils
]]

local Test = require("rcode.tests.framework")

local UtilsTest3 = Test:extend("Rcode.Tests.Utils3")

function UtilsTest3:test_something()
  self:assert(true, "Test should pass")
end

return UtilsTest3
