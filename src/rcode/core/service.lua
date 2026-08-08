--[[
Service Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Service = Class:extend("Rcode.Service")

function Service:init(...)
  -- Constructor
  self:super(...)
end

function Service:method1()
  -- Method implementation
end

function Service:method2()
  -- Another method
end

return Service
