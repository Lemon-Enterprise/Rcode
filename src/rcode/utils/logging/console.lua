--[[
Console Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Console = Class:extend("Rcode.Console")

function Console:init(...)
  -- Constructor
  self:super(...)
end

function Console:method1()
  -- Method implementation
end

function Console:method2()
  -- Another method
end

return Console
