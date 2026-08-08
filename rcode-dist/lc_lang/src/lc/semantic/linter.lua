local Linter = {}
function Linter.run(program) local warnings = {}; if #program.body == 0 then warnings[#warnings + 1] = "empty LC-lang source" end; return warnings end
return Linter
