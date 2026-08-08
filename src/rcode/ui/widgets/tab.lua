--[[
Tab Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Tab = Class:extend("Rcode.Tab")

function Tab:init(...)
  -- Constructor
  self:super(...)
end

function Tab:method1()
  -- Method implementation
end

function Tab:method2()
  -- Another method
end

return Tab
