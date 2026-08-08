--[[
Folder Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Folder = Class:extend("Rcode.Folder")

function Folder:init(...)
  -- Constructor
  self:super(...)
end

function Folder:method1()
  -- Method implementation
end

function Folder:method2()
  -- Another method
end

return Folder
