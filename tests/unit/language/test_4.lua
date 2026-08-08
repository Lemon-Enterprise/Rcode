--[[
Test 4 for language
]]

local Test = require("rcode.tests.framework")

local LanguageTest4 = Test:extend("Rcode.Tests.Language4")

function LanguageTest4:test_something()
  self:assert(true, "Test should pass")
end

return LanguageTest4
