--[[
Test 5 for editor
]]

local Test = require("rcode.tests.framework")

local EditorTest5 = Test:extend("Rcode.Tests.Editor5")

function EditorTest5:test_something()
  self:assert(true, "Test should pass")
end

return EditorTest5
