local Stringx = {}
function Stringx.trim(text) return (text:gsub("^%s+", ""):gsub("%s+$", "")) end
function Stringx.starts_with(text, prefix) return text:sub(1, #prefix) == prefix end
return Stringx
