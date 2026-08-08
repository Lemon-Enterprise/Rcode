--[[
Text Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Text = Class:extend("Rcode.Text")

function Text:init(...)
  -- Constructor
  self:super(...)
end

function Text:method1()
  -- Method implementation
end

function Text:method2()
  -- Another method
end

return Text
