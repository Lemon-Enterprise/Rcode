--[[
Integration Test 2
]]

local Test = require("rcode.tests.framework")

local IntegrationTest2 = Test:extend("Rcode.Tests.Integration2")

function IntegrationTest2:test_integration()
  self:assert(true, "Integration test should pass")
end

return IntegrationTest2
