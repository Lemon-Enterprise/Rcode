--[[
Integration Test 3
]]

local Test = require("rcode.tests.framework")

local IntegrationTest3 = Test:extend("Rcode.Tests.Integration3")

function IntegrationTest3:test_integration()
  self:assert(true, "Integration test should pass")
end

return IntegrationTest3
