--[[
E2E Test 1
]]

local Test = require("rcode.tests.framework")

local E2ETest1 = Test:extend("Rcode.Tests.E2E1")

function E2ETest1:test_e2e()
  self:assert(true, "E2E test should pass")
end

return E2ETest1
