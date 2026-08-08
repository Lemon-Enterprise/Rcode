--[[
Test 3 for language
]]

local Test = require("rcode.tests.framework")

local LanguageTest3 = Test:extend("Rcode.Tests.Language3")

function LanguageTest3:test_something()
  self:assert(true, "Test should pass")
end

return LanguageTest3
