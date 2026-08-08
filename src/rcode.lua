--[[
Rcode - The Ultimate IDE for LC-lang
Built with LuaJIT and the Lemon Code Language infrastructure

Usage:
  luajit src/rcode.lua [command] [file]

Commands:
  edit [file]     - Open file in interactive editor
  parse [file]    - Parse and show AST
  check [file]    - Validate file
  run [file]      - Run LC-lang program
  manifest [file] - Generate manifest from Lemon Studio app
  repl            - Start interactive REPL
  version         - Show version
  help            - Show this help
]]

local root = "src/?.lua;src/?/init.lua;"
if not package.path:find("src/%?%.lua", 1, false) then
  package.path = root .. package.path
end

-- Add lc_lang to path
package.path = "../lc_lang/src/?.lua;" .. package.path

local CLI = require("rcode.cli.main")
CLI.run(arg)
