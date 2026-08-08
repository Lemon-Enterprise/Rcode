--[[
Stress Test 9
]]

local Test = require("rcode.tests.framework")

local StressTest9 = Test:extend("Rcode.Tests.Stress9")

function StressTest9:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest9
