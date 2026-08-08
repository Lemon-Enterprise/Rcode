--[[
Base Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Base = Class:extend("Rcode.Base")

function Base:init(...)
  -- Constructor
  self:super(...)
end

function Base:method1()
  -- Method implementation
end

function Base:method2()
  -- Another method
end

return Base
