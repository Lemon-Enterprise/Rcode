--[[
Test 6 for api
]]

local Test = require("rcode.tests.framework")

local ApiTest6 = Test:extend("Rcode.Tests.Api6")

function ApiTest6:test_something()
  self:assert(true, "Test should pass")
end

return ApiTest6
