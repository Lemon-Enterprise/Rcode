--[[
Test 5 for language
]]

local Test = require("rcode.tests.framework")

local LanguageTest5 = Test:extend("Rcode.Tests.Language5")

function LanguageTest5:test_something()
  self:assert(true, "Test should pass")
end

return LanguageTest5
