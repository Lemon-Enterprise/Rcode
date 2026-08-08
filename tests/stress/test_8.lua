--[[
Stress Test 8
]]

local Test = require("rcode.tests.framework")

local StressTest8 = Test:extend("Rcode.Tests.Stress8")

function StressTest8:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest8
