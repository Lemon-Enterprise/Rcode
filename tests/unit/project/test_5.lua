--[[
Test 5 for project
]]

local Test = require("rcode.tests.framework")

local ProjectTest5 = Test:extend("Rcode.Tests.Project5")

function ProjectTest5:test_something()
  self:assert(true, "Test should pass")
end

return ProjectTest5
