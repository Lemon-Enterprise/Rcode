--[[
Rcode Executor Module
Executes LC-lang programs using the lc_lang runtime
]]

local Executor = {}
local Source = require("lc.common.source")
local Compiler = require("lc.compiler.compiler")
local Evaluator = require("lc.runtime.evaluator")
local Manifest = require("lc.studio.manifest")
local Json = require("lc.common.json")
local Parser = require("rcode.parser.lc_parser")

function Executor.execute_text(text)
  local result = Compiler.compile(text)
  if not result or not result.analysis.ok then
    return nil, "Compilation failed", result and result.analysis.errors
  end
  
  -- Check if it's a Lemon Studio app
  local manifest = Manifest.from_program(result.ast)
  if manifest then
    return { 
      success = true, 
      output = Json.encode(manifest),
      type = "manifest"
    }
  end
  
  -- Execute as regular LC-lang code
  local success, exec_result = pcall(function()
    return Evaluator.run(result.ast)
  end)
  
  if not success then
    return nil, string.format("Execution error: %s", exec_result)
  end
  
  return { 
    success = true, 
    output = tostring(exec_result),
    type = "execution"
  }
end

function Executor.execute_file(filepath)
  local text, err = Source.read(filepath)
  if not text then
    return nil, string.format("Failed to read file: %s", err)
  end
  
  return Executor.execute_text(text)
end

function Executor.run_repl_command(command)
  -- For REPL integration
  return Executor.execute_text(command)
end

function Executor.evaluate_expression(expr, context)
  -- Evaluate a single expression in a given context
  local text = string.format("let __result = %s; __result", expr)
  local result, err = Executor.execute_text(text)
  if not result then
    return nil, err
  end
  return result.output
end

return Executor
