--[[
E2E Test 3
]]

local Test = require("rcode.tests.framework")

local E2ETest3 = Test:extend("Rcode.Tests.E2E3")

function E2ETest3:test_e2e()
  self:assert(true, "E2E test should pass")
end

return E2ETest3
