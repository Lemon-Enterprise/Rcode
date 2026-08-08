local Stack = {}; Stack.__index = Stack
function Stack.new() return setmetatable({ values = {} }, Stack) end
function Stack:push(value) self.values[#self.values + 1] = value end
function Stack:pop() local value = self.values[#self.values]; self.values[#self.values] = nil; return value end
return Stack
