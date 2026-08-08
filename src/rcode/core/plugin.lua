--[[
Plugin Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Plugin = Class:extend("Rcode.Plugin")

function Plugin:init(...)
  -- Constructor
  self:super(...)
end

function Plugin:method1()
  -- Method implementation
end

function Plugin:method2()
  -- Another method
end

return Plugin
