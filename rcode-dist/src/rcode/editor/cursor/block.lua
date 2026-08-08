--[[
Block Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Block = Class:extend("Rcode.Block")

function Block:init(...)
  -- Constructor
  self:super(...)
end

function Block:method1()
  -- Method implementation
end

function Block:method2()
  -- Another method
end

return Block
