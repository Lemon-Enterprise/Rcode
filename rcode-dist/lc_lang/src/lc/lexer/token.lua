local Token = {}
function Token.new(kind, text, value, line, column) return { kind = kind, text = text, value = value, line = line, column = column } end
return Token
