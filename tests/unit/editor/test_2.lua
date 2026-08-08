--[[
Test 2 for editor
]]

local Test = require("rcode.tests.framework")

local EditorTest2 = Test:extend("Rcode.Tests.Editor2")

function EditorTest2:test_something()
  self:assert(true, "Test should pass")
end

return EditorTest2
