--[[
Rcode CLI Main Module
Handles command-line interface and routing
]]

local Main = {}
local Editor = require("rcode.editor.core")
local Parser = require("rcode.parser.lc_parser")
local Runner = require("rcode.runner.executor")
local Config = require("rcode.config.settings")
local Utils = require("rcode.utils.helpers")

local function show_help()
  print([[
Rcode - The Ultimate IDE for LC-lang

Usage:
  luajit src/rcode.lua <command> [file]

Commands:
  edit [file]     - Open file in interactive editor
  parse [file]    - Parse and show AST
  check [file]    - Validate file
  run [file]      - Run LC-lang program
  manifest [file] - Generate manifest from Lemon Studio app
  repl            - Start interactive REPL
  version         - Show version
  help            - Show this help

Examples:
  luajit src/rcode.lua edit examples/test.lc
  luajit src/rcode.lua parse examples/test.lc
  luajit src/rcode.lua run examples/app.lc
  luajit src/rcode.lua check examples/test.lc
  luajit src/rcode.lua manifest examples/lemon_app.lc
]])
end

local function show_version()
  local Rcode = require("rcode")
  print(string.format("%s v%s", Rcode.name, Rcode.version))
  print(Rcode.description)
  print("Built with LuaJIT and LC-lang infrastructure")
end

local function handle_edit(args)
  local filepath = args[2]
  if not filepath then
    print("Error: Please provide a file path")
    print("Usage: luajit src/rcode.lua edit <file>")
    return
  end
  
  if not Utils.file_exists(filepath) then
    print(string.format("Error: File '%s' not found", filepath))
    return
  end
  
  Editor.edit_file(filepath)
end

local function handle_parse(args)
  local filepath = args[2]
  if not filepath then
    print("Error: Please provide a file path")
    print("Usage: luajit src/rcode.lua parse <file>")
    return
  end
  
  local result, err = Parser.parse_file(filepath)
  if not result then
    print(string.format("Parse error: %s", err))
    return
  end
  
  print("AST:")
  print(Utils.json_encode(result.ast))
end

local function handle_check(args)
  local filepath = args[2]
  if not filepath then
    print("Error: Please provide a file path")
    print("Usage: luajit src/rcode.lua check <file>")
    return
  end
  
  local result, err = Parser.parse_and_validate(filepath)
  if not result then
    print(string.format("Validation error: %s", err))
    return
  end
  
  print(string.format("File '%s' is valid LC-lang code", filepath))
end

local function handle_run(args)
  local filepath = args[2]
  if not filepath then
    print("Error: Please provide a file path")
    print("Usage: luajit src/rcode.lua run <file>")
    return
  end
  
  local result, err = Runner.execute_file(filepath)
  if not result then
    print(string.format("Execution error: %s", err))
    return
  end
  
  print("Execution successful")
  if result.output then
    print("Output:")
    print(result.output)
  end
end

local function handle_manifest(args)
  local filepath = args[2]
  if not filepath then
    print("Error: Please provide a file path")
    print("Usage: luajit src/rcode.lua manifest <file>")
    return
  end
  
  local result, err = Parser.generate_manifest(filepath)
  if not result then
    print(string.format("Manifest generation error: %s", err))
    return
  end
  
  print("Manifest:")
  print(Utils.json_encode(result))
end

local function handle_repl()
  print("Starting Rcode REPL...")
  print("Type 'exit' or 'quit' to exit")
  print("Type 'help' for commands")
  
  local REPL = require("rcode.ui.repl")
  REPL.start()
end

function Main.run(args)
  local command = args[1] or "help"
  
  local commands = {
    help = show_help,
    version = show_version,
    edit = handle_edit,
    parse = handle_parse,
    check = handle_check,
    run = handle_run,
    manifest = handle_manifest,
    repl = handle_repl,
  }
  
  local handler = commands[command]
  if handler then
    handler(args)
  else
    print(string.format("Unknown command: %s", command))
    print("Type 'help' for available commands")
  end
end

return Main
