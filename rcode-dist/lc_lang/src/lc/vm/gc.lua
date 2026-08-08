local GC = {}
function GC.collect(heap) return #heap.objects end
return GC
