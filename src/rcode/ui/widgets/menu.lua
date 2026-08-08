--[[
Menu Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Menu = Class:extend("Rcode.Menu")

function Menu:init(...)
  -- Constructor
  self:super(...)
end

function Menu:method1()
  -- Method implementation
end

function Menu:method2()
  -- Another method
end

return Menu
