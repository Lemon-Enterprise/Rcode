--[[
Performance Test 5
]]

local Test = require("rcode.tests.framework")

local PerformanceTest5 = Test:extend("Rcode.Tests.Performance5")

function PerformanceTest5:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest5
