--[[
Session Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Session = Class:extend("Rcode.Session")

function Session:init(...)
  -- Constructor
  self:super(...)
end

function Session:method1()
  -- Method implementation
end

function Session:method2()
  -- Another method
end

return Session
