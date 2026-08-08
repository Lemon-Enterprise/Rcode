--[[
Tree Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Tree = Class:extend("Rcode.Tree")

function Tree:init(...)
  -- Constructor
  self:super(...)
end

function Tree:method1()
  -- Method implementation
end

function Tree:method2()
  -- Another method
end

return Tree
