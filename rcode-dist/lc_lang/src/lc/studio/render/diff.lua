local Diff = {}
function Diff.compare(previous, next) return previous == next and {} or { { operation = "replace", value = next } } end
return Diff
