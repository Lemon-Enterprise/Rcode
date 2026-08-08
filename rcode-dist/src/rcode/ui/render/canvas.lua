--[[
Canvas Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Canvas = Class:extend("Rcode.Canvas")

function Canvas:init(...)
  -- Constructor
  self:super(...)
end

function Canvas:method1()
  -- Method implementation
end

function Canvas:method2()
  -- Another method
end

return Canvas
