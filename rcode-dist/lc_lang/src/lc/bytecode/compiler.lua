local Chunk, Instruction, Opcodes = require("lc.bytecode.chunk"), require("lc.bytecode.instruction"), require("lc.bytecode.opcodes")
local Compiler = {}
function Compiler.compile(program)
  local chunk = Chunk.new("main")
  for _, node in ipairs(program.body) do if node.kind == "Let" and node.value.kind == "Literal" then local index = Chunk.constant(chunk, node.value.value); Chunk.emit(chunk, Instruction(Opcodes.load_constant, index)); Chunk.emit(chunk, Instruction(Opcodes.store_name, node.name)) end end
  Chunk.emit(chunk, Instruction(Opcodes.halt)); return chunk
end
return Compiler
