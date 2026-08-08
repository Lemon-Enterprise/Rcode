--[[
Performance Test 10
]]

local Test = require("rcode.tests.framework")

local PerformanceTest10 = Test:extend("Rcode.Tests.Performance10")

function PerformanceTest10:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest10
