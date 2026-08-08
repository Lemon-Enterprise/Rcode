local Printer = {}
function Printer.print(program) local lines = {}; for _, node in ipairs(program.body) do lines[#lines + 1] = node.kind end; return table.concat(lines, "\n") end
return Printer
