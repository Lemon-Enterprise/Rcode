local SymbolTable = {}; SymbolTable.__index = SymbolTable
function SymbolTable.new() return setmetatable({ symbols = {} }, SymbolTable) end
function SymbolTable:add(symbol) self.symbols[symbol.name] = symbol end
function SymbolTable:get(name) return self.symbols[name] end
return SymbolTable
