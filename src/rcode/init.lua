--[[
Rcode initialization module
Loads all core modules and sets up the environment
]]

local Rcode = {}

Rcode.version = "1.0.0"
Rcode.name = "Rcode"
Rcode.description = "The Ultimate IDE for LC-lang"

-- Core modules
Rcode.CLI = require("rcode.cli.main")
Rcode.Editor = require("rcode.editor.core")
Rcode.Parser = require("rcode.parser.lc_parser")
Rcode.Runner = require("rcode.runner.executor")
Rcode.UI = require("rcode.ui.tui")
Rcode.Config = require("rcode.config.settings")
Rcode.Utils = require("rcode.utils.helpers")

function Rcode.run(args)
  Rcode.CLI.run(args)
end

return Rcode
