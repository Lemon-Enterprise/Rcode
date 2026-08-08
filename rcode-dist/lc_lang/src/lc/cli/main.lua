local Source, Json, Compiler = require("lc.common.source"), require("lc.common.json"), require("lc.compiler.compiler")
local Evaluator, Manifest, Usage, Lspec = require("lc.runtime.evaluator"), require("lc.studio.manifest"), require("lc.cli.usage"), require("lc.package.lspec")
local Main = {}
function Main.run(args)
  local command, path = args[1] or "help", args[2]
  if command == "help" then print(Usage); return end
  if command ~= "run" and command ~= "check" and command ~= "parse" and command ~= "lspec" then error("unknown LC-lang command: " .. command) end
  if not path then error("provide a source or .lspec file") end
  if command == "lspec" then local spec, spec_err = Lspec.read(path); if not spec then error(spec_err) end; print(Json.encode(spec)); return end
  local text, err = Source.read(path); if not text then error(err) end
  local result = Compiler.compile(text); if not result.analysis.ok then error(table.concat(result.analysis.errors, "\n")) end
  if command == "check" then print("LC-lang: '" .. path .. "' is valid.") elseif command == "parse" then print(Json.encode(result.ast)) else local manifest = Manifest.from_program(result.ast); if manifest then print(Json.encode(manifest)) else Evaluator.run(result.ast) end end
end
return Main
