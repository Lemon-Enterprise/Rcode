--[[
Terminal Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Terminal = Class:extend("Rcode.Terminal")

function Terminal:init(...)
  -- Constructor
  self:super(...)
end

function Terminal:method1()
  -- Method implementation
end

function Terminal:method2()
  -- Another method
end

return Terminal
