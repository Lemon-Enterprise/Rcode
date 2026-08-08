--[[
Test 4 for ui
]]

local Test = require("rcode.tests.framework")

local UiTest4 = Test:extend("Rcode.Tests.Ui4")

function UiTest4:test_something()
  self:assert(true, "Test should pass")
end

return UiTest4
