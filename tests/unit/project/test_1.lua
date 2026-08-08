--[[
Test 1 for project
]]

local Test = require("rcode.tests.framework")

local ProjectTest1 = Test:extend("Rcode.Tests.Project1")

function ProjectTest1:test_something()
  self:assert(true, "Test should pass")
end

return ProjectTest1
