local Chunk = {}
function Chunk.new(name) return { name = name, code = {}, constants = {} } end
function Chunk.constant(chunk, value) chunk.constants[#chunk.constants + 1] = value; return #chunk.constants end
function Chunk.emit(chunk, instruction) chunk.code[#chunk.code + 1] = instruction; return #chunk.code end
return Chunk
