--[[
Stress Test 4
]]

local Test = require("rcode.tests.framework")

local StressTest4 = Test:extend("Rcode.Tests.Stress4")

function StressTest4:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest4
