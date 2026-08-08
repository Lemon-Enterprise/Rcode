--[[
Performance Test 4
]]

local Test = require("rcode.tests.framework")

local PerformanceTest4 = Test:extend("Rcode.Tests.Performance4")

function PerformanceTest4:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest4
