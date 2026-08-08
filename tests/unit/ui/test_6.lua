--[[
Test 6 for ui
]]

local Test = require("rcode.tests.framework")

local UiTest6 = Test:extend("Rcode.Tests.Ui6")

function UiTest6:test_something()
  self:assert(true, "Test should pass")
end

return UiTest6
