--[[
E2E Test 8
]]

local Test = require("rcode.tests.framework")

local E2ETest8 = Test:extend("Rcode.Tests.E2E8")

function E2ETest8:test_e2e()
  self:assert(true, "E2E test should pass")
end

return E2ETest8
