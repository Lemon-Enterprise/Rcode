--[[
Piece_table Class
Object-oriented implementation for Rcode
]]

local Class = require("rcode.utils.class")

local Piece_table = Class:extend("Rcode.Piece_table")

function Piece_table:init(...)
  -- Constructor
  self:super(...)
end

function Piece_table:method1()
  -- Method implementation
end

function Piece_table:method2()
  -- Another method
end

return Piece_table
