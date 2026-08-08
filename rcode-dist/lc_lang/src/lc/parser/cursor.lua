local Cursor = {}; Cursor.__index = Cursor
function Cursor.new(tokens) return setmetatable({ tokens = tokens, index = 1 }, Cursor) end
function Cursor:current() return self.tokens[self.index] end
function Cursor:advance() local value = self:current(); self.index = self.index + 1; return value end
return Cursor
