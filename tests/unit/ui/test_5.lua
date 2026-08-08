--[[
Test 5 for ui
]]

local Test = require("rcode.tests.framework")

local UiTest5 = Test:extend("Rcode.Tests.Ui5")

function UiTest5:test_something()
  self:assert(true, "Test should pass")
end

return UiTest5
