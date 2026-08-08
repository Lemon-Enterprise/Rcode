--[[
Integration Test 20
]]

local Test = require("rcode.tests.framework")

local IntegrationTest20 = Test:extend("Rcode.Tests.Integration20")

function IntegrationTest20:test_integration()
  self:assert(true, "Integration test should pass")
end

return IntegrationTest20
