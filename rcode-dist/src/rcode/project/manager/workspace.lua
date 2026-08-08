--[[
Workspace Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Workspace = Class:extend("Rcode.Workspace")

function Workspace:init(...)
  -- Constructor
  self:super(...)
end

function Workspace:method1()
  -- Method implementation
end

function Workspace:method2()
  -- Another method
end

return Workspace
