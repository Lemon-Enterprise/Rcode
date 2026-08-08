--[[
Test 6 for project
]]

local Test = require("rcode.tests.framework")

local ProjectTest6 = Test:extend("Rcode.Tests.Project6")

function ProjectTest6:test_something()
  self:assert(true, "Test should pass")
end

return ProjectTest6
