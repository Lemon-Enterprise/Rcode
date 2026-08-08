--[[
Line Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Line = Class:extend("Rcode.Line")

function Line:init(...)
  -- Constructor
  self:super(...)
end

function Line:method1()
  -- Method implementation
end

function Line:method2()
  -- Another method
end

return Line
