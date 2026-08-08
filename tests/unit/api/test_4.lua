--[[
Test 4 for api
]]

local Test = require("rcode.tests.framework")

local ApiTest4 = Test:extend("Rcode.Tests.Api4")

function ApiTest4:test_something()
  self:assert(true, "Test should pass")
end

return ApiTest4
