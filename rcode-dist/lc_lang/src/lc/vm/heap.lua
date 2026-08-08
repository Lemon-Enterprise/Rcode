local Heap = {}; Heap.__index = Heap
function Heap.new() return setmetatable({ objects = {} }, Heap) end
function Heap:allocate(value) self.objects[#self.objects + 1] = value; return value end
return Heap
