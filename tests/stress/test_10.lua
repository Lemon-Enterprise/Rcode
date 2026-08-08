--[[
Stress Test 10
]]

local Test = require("rcode.tests.framework")

local StressTest10 = Test:extend("Rcode.Tests.Stress10")

function StressTest10:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest10
