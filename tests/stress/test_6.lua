--[[
Stress Test 6
]]

local Test = require("rcode.tests.framework")

local StressTest6 = Test:extend("Rcode.Tests.Stress6")

function StressTest6:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest6
