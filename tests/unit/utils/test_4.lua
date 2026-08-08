--[[
Test 4 for utils
]]

local Test = require("rcode.tests.framework")

local UtilsTest4 = Test:extend("Rcode.Tests.Utils4")

function UtilsTest4:test_something()
  self:assert(true, "Test should pass")
end

return UtilsTest4
