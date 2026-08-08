--[[
Statusbar Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Statusbar = Class:extend("Rcode.Statusbar")

function Statusbar:init(...)
  -- Constructor
  self:super(...)
end

function Statusbar:method1()
  -- Method implementation
end

function Statusbar:method2()
  -- Another method
end

return Statusbar
