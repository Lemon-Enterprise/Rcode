local Assertions = {}
function Assertions.equal(left, right, message) if left ~= right then error(message or (tostring(left) .. " ~= " .. tostring(right)), 2) end end
return Assertions
