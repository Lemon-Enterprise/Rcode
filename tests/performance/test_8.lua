--[[
Performance Test 8
]]

local Test = require("rcode.tests.framework")

local PerformanceTest8 = Test:extend("Rcode.Tests.Performance8")

function PerformanceTest8:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest8
