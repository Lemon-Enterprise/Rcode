--[[
E2E Test 2
]]

local Test = require("rcode.tests.framework")

local E2ETest2 = Test:extend("Rcode.Tests.E2E2")

function E2ETest2:test_e2e()
  self:assert(true, "E2E test should pass")
end

return E2ETest2
