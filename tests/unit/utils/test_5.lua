--[[
Test 5 for utils
]]

local Test = require("rcode.tests.framework")

local UtilsTest5 = Test:extend("Rcode.Tests.Utils5")

function UtilsTest5:test_something()
  self:assert(true, "Test should pass")
end

return UtilsTest5
