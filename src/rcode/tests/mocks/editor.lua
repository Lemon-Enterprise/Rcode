--[[
Mock Editor
]]

local MockEditor = {}

function MockEditor:new()
  return { buffer = "", cursor = { line = 1, column = 1 } }
end

return MockEditor
