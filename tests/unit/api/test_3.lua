--[[
Test 3 for api
]]

local Test = require("rcode.tests.framework")

local ApiTest3 = Test:extend("Rcode.Tests.Api3")

function ApiTest3:test_something()
  self:assert(true, "Test should pass")
end

return ApiTest3
