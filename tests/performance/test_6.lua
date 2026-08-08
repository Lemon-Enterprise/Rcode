--[[
Performance Test 6
]]

local Test = require("rcode.tests.framework")

local PerformanceTest6 = Test:extend("Rcode.Tests.Performance6")

function PerformanceTest6:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest6
