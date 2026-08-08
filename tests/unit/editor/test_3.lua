--[[
Test 3 for editor
]]

local Test = require("rcode.tests.framework")

local EditorTest3 = Test:extend("Rcode.Tests.Editor3")

function EditorTest3:test_something()
  self:assert(true, "Test should pass")
end

return EditorTest3
