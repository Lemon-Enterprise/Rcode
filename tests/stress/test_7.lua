--[[
Stress Test 7
]]

local Test = require("rcode.tests.framework")

local StressTest7 = Test:extend("Rcode.Tests.Stress7")

function StressTest7:test_stress()
  for j = 1, 1000 do
    -- Stress test code
  end
end

return StressTest7
