local Disassembler = {}
function Disassembler.print(chunk) local lines = {}; for index, item in ipairs(chunk.code) do lines[#lines + 1] = string.format("%04d %-18s %s", index, item.opcode, tostring(item.operand or "")) end; return table.concat(lines, "\n") end
return Disassembler
