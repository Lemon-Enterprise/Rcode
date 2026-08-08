--[[
Visual Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Visual = Class:extend("Rcode.Visual")

function Visual:init(...)
  -- Constructor
  self:super(...)
end

function Visual:method1()
  -- Method implementation
end

function Visual:method2()
  -- Another method
end

return Visual
