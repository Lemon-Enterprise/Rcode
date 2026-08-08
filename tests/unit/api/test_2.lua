--[[
Test 2 for api
]]

local Test = require("rcode.tests.framework")

local ApiTest2 = Test:extend("Rcode.Tests.Api2")

function ApiTest2:test_something()
  self:assert(true, "Test should pass")
end

return ApiTest2
