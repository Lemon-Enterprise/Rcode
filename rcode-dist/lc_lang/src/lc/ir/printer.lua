local Printer = {}
function Printer.print(module) local lines = { "; LC-lang IR " .. module.name }; for _, fn in ipairs(module.functions) do lines[#lines + 1] = "fn " .. fn.name end; return table.concat(lines, "\n") end
return Printer
