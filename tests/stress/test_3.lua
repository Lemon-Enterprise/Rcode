--[[
Stress Test 3
]]

local Test = require("rcode.tests.framework")

local StressTest3 = Test:extend("Rcode.Tests.Stress3")

function StressTest3:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest3
