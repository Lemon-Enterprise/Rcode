local Block = {}
function Block.new(label) return { label = label, instructions = {} } end
function Block.emit(block, instruction) block.instructions[#block.instructions + 1] = instruction end
return Block
