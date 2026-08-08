local Keywords = require("lc.lexer.keywords")
local Completion = {}
function Completion.items() local items = {}; for word in pairs(Keywords) do items[#items + 1] = { label = word, kind = "Keyword" } end; return items end
return Completion
