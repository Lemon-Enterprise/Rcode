--[[
Test 5 for api
]]

local Test = require("rcode.tests.framework")

local ApiTest5 = Test:extend("Rcode.Tests.Api5")

function ApiTest5:test_something()
  self:assert(true, "Test should pass")
end

return ApiTest5
