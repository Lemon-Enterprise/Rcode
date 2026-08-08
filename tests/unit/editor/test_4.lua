--[[
Test 4 for editor
]]

local Test = require("rcode.tests.framework")

local EditorTest4 = Test:extend("Rcode.Tests.Editor4")

function EditorTest4:test_something()
  self:assert(true, "Test should pass")
end

return EditorTest4
