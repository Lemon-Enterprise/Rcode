--[[
Test 1 for language
]]

local Test = require("rcode.tests.framework")

local LanguageTest1 = Test:extend("Rcode.Tests.Language1")

function LanguageTest1:test_something()
  self:assert(true, "Test should pass")
end

return LanguageTest1
