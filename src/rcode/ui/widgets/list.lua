--[[
List Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local List = Class:extend("Rcode.List")

function List:init(...)
  -- Constructor
  self:super(...)
end

function List:method1()
  -- Method implementation
end

function List:method2()
  -- Another method
end

return List
