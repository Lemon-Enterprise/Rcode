--[[
Adapter Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Adapter = Class:extend("Rcode.Adapter")

function Adapter:init(...)
  -- Constructor
  self:super(...)
end

function Adapter:method1()
  -- Method implementation
end

function Adapter:method2()
  -- Another method
end

return Adapter
