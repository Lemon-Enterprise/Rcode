--[[
Test 2 for ui
]]

local Test = require("rcode.tests.framework")

local UiTest2 = Test:extend("Rcode.Tests.Ui2")

function UiTest2:test_something()
  self:assert(true, "Test should pass")
end

return UiTest2
