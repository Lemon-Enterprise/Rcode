local Parser, Analyzer = require("lc.parser.parser"), require("lc.semantic.analyzer")
local Compiler = {}
function Compiler.compile(text) local ast = Parser.parse(text); local analysis = Analyzer.analyze(ast); return { ast = ast, analysis = analysis } end
return Compiler
