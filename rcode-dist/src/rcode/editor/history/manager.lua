--[[
Manager Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Manager = Class:extend("Rcode.Manager")

function Manager:init(...)
  -- Constructor
  self:super(...)
end

function Manager:method1()
  -- Method implementation
end

function Manager:method2()
  -- Another method
end

return Manager
