--[[
Test 2 for project
]]

local Test = require("rcode.tests.framework")

local ProjectTest2 = Test:extend("Rcode.Tests.Project2")

function ProjectTest2:test_something()
  self:assert(true, "Test should pass")
end

return ProjectTest2
