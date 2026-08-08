local Instruction = {}
function Instruction.new(opcode, operands) return { opcode = opcode, operands = operands or {} } end
return Instruction
