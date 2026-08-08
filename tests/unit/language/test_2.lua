--[[
Test 2 for language
]]

local Test = require("rcode.tests.framework")

local LanguageTest2 = Test:extend("Rcode.Tests.Language2")

function LanguageTest2:test_something()
  self:assert(true, "Test should pass")
end

return LanguageTest2
