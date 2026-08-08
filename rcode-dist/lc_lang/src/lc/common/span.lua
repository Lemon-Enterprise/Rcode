local Span = {}
function Span.new(start_pos, end_pos) return { start = start_pos, finish = end_pos } end
return Span
