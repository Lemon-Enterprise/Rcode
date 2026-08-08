--[[
Panel Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Panel = Class:extend("Rcode.Panel")

function Panel:init(...)
  -- Constructor
  self:super(...)
end

function Panel:method1()
  -- Method implementation
end

function Panel:method2()
  -- Another method
end

return Panel
