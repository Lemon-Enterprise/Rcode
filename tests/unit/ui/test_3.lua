--[[
Test 3 for ui
]]

local Test = require("rcode.tests.framework")

local UiTest3 = Test:extend("Rcode.Tests.Ui3")

function UiTest3:test_something()
  self:assert(true, "Test should pass")
end

return UiTest3
