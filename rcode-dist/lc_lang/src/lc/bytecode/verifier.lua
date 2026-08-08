local Verifier = {}
function Verifier.check(chunk) return chunk and chunk.code and #chunk.code > 0, "bytecode chunk must have instructions" end
return Verifier
