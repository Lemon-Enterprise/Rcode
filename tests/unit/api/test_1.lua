--[[
Test 1 for api
]]

local Test = require("rcode.tests.framework")

local ApiTest1 = Test:extend("Rcode.Tests.Api1")

function ApiTest1:test_something()
  self:assert(true, "Test should pass")
end

return ApiTest1
