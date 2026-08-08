--[[
Rcode REPL Module
Interactive Read-Eval-Print Loop for LC-lang
]]

local REPL = {}
local Executor = require("rcode.runner.executor")
local Parser = require("rcode.parser.lc_parser")
local Utils = require("rcode.utils.helpers")

function REPL.show_prompt()
  io.write("rcode> ")
end

function REPL.evaluate_input(input)
  -- Check for REPL commands
  if input == "exit" or input == "quit" then
    return { type = "exit" }
  end
  
  if input == "help" then
    return {
      type = "output",
      value = [[
REPL Commands:
  exit, quit    - Exit REPL
  help         - Show this help
  clear        - Clear screen
  Any LC-lang expression or statement
]]
    }
  end
  
  if input == "clear" then
    io.write("\27[2J\27[H")
    return { type = "continue" }
  end
  
  -- Try to execute as LC-lang code
  local result, err = Executor.execute_text(input)
  if result then
    return { type = "output", value = result.output }
  else
    return { type = "error", value = err }
  end
end

function REPL.start()
  print("Rcode REPL - Interactive LC-lang Shell")
  print("Type 'help' for commands, 'exit' to quit")
  print()
  
  while true do
    REPL.show_prompt()
    local input = io.read()
    
    if not input then
      break
    end
    
    local result = REPL.evaluate_input(input)
    
    if result.type == "exit" then
      break
    elseif result.type == "output" then
      print(result.value)
    elseif result.type == "error" then
      print(string.format("Error: %s", result.value))
    end
    
    print()
  end
  
  print("Goodbye!")
end

return REPL
