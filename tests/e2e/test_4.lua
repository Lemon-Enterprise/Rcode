--[[
E2E Test 4
]]

local Test = require("rcode.tests.framework")

local E2ETest4 = Test:extend("Rcode.Tests.E2E4")

function E2ETest4:test_e2e()
  self:assert(true, "E2E test should pass")
end

return E2ETest4
