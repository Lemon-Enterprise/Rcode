--[[
Test 4 for project
]]

local Test = require("rcode.tests.framework")

local ProjectTest4 = Test:extend("Rcode.Tests.Project4")

function ProjectTest4:test_something()
  self:assert(true, "Test should pass")
end

return ProjectTest4
