--[[
Entry Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Entry = Class:extend("Rcode.Entry")

function Entry:init(...)
  -- Constructor
  self:super(...)
end

function Entry:method1()
  -- Method implementation
end

function Entry:method2()
  -- Another method
end

return Entry
