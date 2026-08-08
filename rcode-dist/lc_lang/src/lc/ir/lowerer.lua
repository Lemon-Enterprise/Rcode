local Module = require("lc.ir.module")
local Lowerer = {}
function Lowerer.lower(program) local module = Module.new("main"); for _, node in ipairs(program.body) do if node.kind == "Function" then module.functions[#module.functions + 1] = { name = node.name, ast = node } end end; return module end
return Lowerer
