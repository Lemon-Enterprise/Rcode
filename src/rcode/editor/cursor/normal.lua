--[[
Normal Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Normal = Class:extend("Rcode.Normal")

function Normal:init(...)
  -- Constructor
  self:super(...)
end

function Normal:method1()
  -- Method implementation
end

function Normal:method2()
  -- Another method
end

return Normal
