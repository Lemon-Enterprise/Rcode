--[[
Input Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Input = Class:extend("Rcode.Input")

function Input:init(...)
  -- Constructor
  self:super(...)
end

function Input:method1()
  -- Method implementation
end

function Input:method2()
  -- Another method
end

return Input
