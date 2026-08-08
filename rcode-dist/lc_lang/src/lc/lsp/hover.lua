local Hover = {}
function Hover.info(word) return word and { contents = "LC-lang symbol: " .. word } or nil end
return Hover
