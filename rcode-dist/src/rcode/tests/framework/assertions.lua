--[[
Test Assertions
]]

local Assertions = {}

function Assertions.equal(actual, expected, message)
  if actual ~= expected then
    error(string.format("%s: Expected %s, got %s", message or "", tostring(expected), tostring(actual)))
  end
end

function Assertions.true(value, message)
  if value ~= true then
    error(message or "Expected true")
  end
end

return Assertions
