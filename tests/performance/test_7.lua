--[[
Performance Test 7
]]

local Test = require("rcode.tests.framework")

local PerformanceTest7 = Test:extend("Rcode.Tests.Performance7")

function PerformanceTest7:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest7
