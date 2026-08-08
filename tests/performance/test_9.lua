--[[
Performance Test 9
]]

local Test = require("rcode.tests.framework")

local PerformanceTest9 = Test:extend("Rcode.Tests.Performance9")

function PerformanceTest9:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest9
