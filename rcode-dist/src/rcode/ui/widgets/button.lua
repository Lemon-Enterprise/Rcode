--[[
Button Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Button = Class:extend("Rcode.Button")

function Button:init(...)
  -- Constructor
  self:super(...)
end

function Button:method1()
  -- Method implementation
end

function Button:method2()
  -- Another method
end

return Button
