--[[
Stress Test 5
]]

local Test = require("rcode.tests.framework")

local StressTest5 = Test:extend("Rcode.Tests.Stress5")

function StressTest5:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest5
