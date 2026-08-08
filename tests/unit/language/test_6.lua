--[[
Test 6 for language
]]

local Test = require("rcode.tests.framework")

local LanguageTest6 = Test:extend("Rcode.Tests.Language6")

function LanguageTest6:test_something()
  self:assert(true, "Test should pass")
end

return LanguageTest6
