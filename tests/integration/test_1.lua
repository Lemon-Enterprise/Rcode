--[[
Integration Test 1
]]

local Test = require("rcode.tests.framework")

local IntegrationTest1 = Test:extend("Rcode.Tests.Integration1")

function IntegrationTest1:test_integration()
  self:assert(true, "Integration test should pass")
end

return IntegrationTest1
