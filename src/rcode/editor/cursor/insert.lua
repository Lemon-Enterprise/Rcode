--[[
Insert Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Insert = Class:extend("Rcode.Insert")

function Insert:init(...)
  -- Constructor
  self:super(...)
end

function Insert:method1()
  -- Method implementation
end

function Insert:method2()
  -- Another method
end

return Insert
