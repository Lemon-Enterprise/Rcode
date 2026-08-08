--[[
Test 1 for editor
]]

local Test = require("rcode.tests.framework")

local EditorTest1 = Test:extend("Rcode.Tests.Editor1")

function EditorTest1:test_something()
  self:assert(true, "Test should pass")
end

return EditorTest1
