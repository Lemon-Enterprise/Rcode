local Reader = {}; Reader.__index = Reader
function Reader.new(text) return setmetatable({ text = text, index = 1, line = 1, column = 1 }, Reader) end
function Reader:peek(offset) return self.text:sub(self.index + (offset or 0), self.index + (offset or 0)) end
function Reader:take() local char = self:peek(); self.index = self.index + 1; if char == "\n" then self.line = self.line + 1; self.column = 1 else self.column = self.column + 1 end; return char end
function Reader:eof() return self.index > #self.text end
return Reader
