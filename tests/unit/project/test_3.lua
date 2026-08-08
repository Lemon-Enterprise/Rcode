--[[
Test 3 for project
]]

local Test = require("rcode.tests.framework")

local ProjectTest3 = Test:extend("Rcode.Tests.Project3")

function ProjectTest3:test_something()
  self:assert(true, "Test should pass")
end

return ProjectTest3
