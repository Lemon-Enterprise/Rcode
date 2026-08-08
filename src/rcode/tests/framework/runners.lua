--[[
Test Runners
]]

local Runners = {}

function Runners.run_suite(suite)
  for name, test in pairs(suite) do
    if type(test) == "function" then
      test()
    end
  end
end

return Runners
