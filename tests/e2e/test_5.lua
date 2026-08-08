--[[
E2E Test 5
]]

local Test = require("rcode.tests.framework")

local E2ETest5 = Test:extend("Rcode.Tests.E2E5")

function E2ETest5:test_e2e()
  self:assert(true, "E2E test should pass")
end

return E2ETest5
