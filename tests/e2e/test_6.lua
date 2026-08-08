--[[
E2E Test 6
]]

local Test = require("rcode.tests.framework")

local E2ETest6 = Test:extend("Rcode.Tests.E2E6")

function E2ETest6:test_e2e()
  self:assert(true, "E2E test should pass")
end

return E2ETest6
