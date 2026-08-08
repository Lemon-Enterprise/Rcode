local Pass = {}
function Pass.new(name) return { name = name, run = function(_, program) return program end } end
return Pass
