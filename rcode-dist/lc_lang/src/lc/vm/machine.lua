local Stack, Opcodes = require("lc.vm.stack"), require("lc.bytecode.opcodes")
local Machine = {}; Machine.__index = Machine
function Machine.new() return setmetatable({ stack = Stack.new(), globals = {} }, Machine) end
function Machine:run(chunk)
  local ip = 1; while true do local instruction = chunk.code[ip]; if instruction.opcode == Opcodes.load_constant then self.stack:push(chunk.constants[instruction.operand]) elseif instruction.opcode == Opcodes.store_name then self.globals[instruction.operand] = self.stack:pop() elseif instruction.opcode == Opcodes.halt then break end; ip = ip + 1 end; return self.globals
end
return Machine
