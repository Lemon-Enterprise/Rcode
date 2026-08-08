--[[
Performance Test 2
]]

local Test = require("rcode.tests.framework")

local PerformanceTest2 = Test:extend("Rcode.Tests.Performance2")

function PerformanceTest2:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest2
