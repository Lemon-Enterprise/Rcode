--[[
Stress Test 1
]]

local Test = require("rcode.tests.framework")

local StressTest1 = Test:extend("Rcode.Tests.Stress1")

function StressTest1:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest1
