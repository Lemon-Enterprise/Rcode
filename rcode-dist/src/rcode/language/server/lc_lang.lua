--[[
Lc_lang Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Lc_lang = Class:extend("Rcode.Lc_lang")

function Lc_lang:init(...)
  -- Constructor
  self:super(...)
end

function Lc_lang:method1()
  -- Method implementation
end

function Lc_lang:method2()
  -- Another method
end

return Lc_lang
