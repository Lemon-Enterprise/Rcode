--[[
Performance Test 1
]]

local Test = require("rcode.tests.framework")

local PerformanceTest1 = Test:extend("Rcode.Tests.Performance1")

function PerformanceTest1:test_performance()
  local start = os.clock()
  -- Performance test code
  local elapsed = os.clock() - start
  self:assert(elapsed < 1.0, "Performance test took too long")
end

return PerformanceTest1
