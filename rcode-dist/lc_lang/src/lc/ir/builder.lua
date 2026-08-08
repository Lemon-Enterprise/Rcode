local Instruction = require("lc.ir.instruction")
local Builder = {}
function Builder.emit(block, opcode, operands) local item = Instruction.new(opcode, operands); block.instructions[#block.instructions + 1] = item; return item end
return Builder
