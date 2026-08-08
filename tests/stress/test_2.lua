--[[
Stress Test 2
]]

local Test = require("rcode.tests.framework")

local StressTest2 = Test:extend("Rcode.Tests.Stress2")

function StressTest2:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest2
