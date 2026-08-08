--[[
Test 1 for ui
]]

local Test = require("rcode.tests.framework")

local UiTest1 = Test:extend("Rcode.Tests.Ui1")

function UiTest1:test_something()
  self:assert(true, "Test should pass")
end

return UiTest1
