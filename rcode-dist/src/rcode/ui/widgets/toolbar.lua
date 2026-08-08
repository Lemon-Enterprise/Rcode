--[[
Toolbar Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Toolbar = Class:extend("Rcode.Toolbar")

function Toolbar:init(...)
  -- Constructor
  self:super(...)
end

function Toolbar:method1()
  -- Method implementation
end

function Toolbar:method2()
  -- Another method
end

return Toolbar
