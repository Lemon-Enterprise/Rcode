--[[
Gap Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Gap = Class:extend("Rcode.Gap")

function Gap:init(...)
  -- Constructor
  self:super(...)
end

function Gap:method1()
  -- Method implementation
end

function Gap:method2()
  -- Another method
end

return Gap
