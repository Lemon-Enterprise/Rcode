--[[
Test 6 for editor
]]

local Test = require("rcode.tests.framework")

local EditorTest6 = Test:extend("Rcode.Tests.Editor6")

function EditorTest6:test_something()
  self:assert(true, "Test should pass")
end

return EditorTest6
