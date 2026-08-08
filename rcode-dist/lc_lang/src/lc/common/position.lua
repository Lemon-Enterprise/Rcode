local Position = {}
function Position.new(line, column, offset) return { line = line, column = column, offset = offset } end
return Position
