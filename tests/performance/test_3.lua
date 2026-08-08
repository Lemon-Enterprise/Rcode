--[[
Performance Test 3
]]

local Test = require("rcode.tests.framework")

local PerformanceTest3 = Test:extend("Rcode.Tests.Performance3")

function PerformanceTest3:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest3
