--[[
Rcode Editor Core Module
Provides file editing capabilities with syntax highlighting and validation
]]

local Editor = {}
local Parser = require("rcode.parser.lc_parser")
local Utils = require("rcode.utils.helpers")
local Config = require("rcode.config.settings")

function Editor.edit_file(filepath)
  print(string.format("Editing: %s", filepath))
  print("Press Ctrl+C to exit, :w to save, :q to quit")
  
  -- Read file content
  local content, err = Utils.read_file(filepath)
  if not content then
    print(string.format("Error reading file: %s", err))
    return
  end
  
  -- Start interactive editing session
  local TUI = require("rcode.ui.tui")
  TUI.start_editor(filepath, content)
end

function Editor.create_file(filepath)
  local content = ""
  local TUI = require("rcode.ui.tui")
  TUI.start_editor(filepath, content, true)
end

function Editor.validate_content(content)
  return Parser.validate_syntax(content)
end

function Editor.get_syntax_highlighting(content)
  -- Basic syntax highlighting for LC-lang
  local highlighted = {}
  local lines = Utils.split(content, "\n")
  
  for i, line in ipairs(lines) do
    highlighted[i] = Editor.highlight_line(line)
  end
  
  return highlighted
end

function Editor.highlight_line(line)
  -- Apply syntax highlighting to a single line
  local highlighted = line
  
  -- Keywords
  highlighted = highlighted:gsub("(@import)", "\27[35m%1\27[0m")  -- purple
  highlighted = highlighted:gsub("(pub)%s+", "\27[36m%1\27[0m ")  -- cyan
  highlighted = highlighted:gsub("(fn)%s+", "\27[33m%1\27[0m ")  -- yellow
  highlighted = highlighted:gsub("(let)%s+", "\27[32m%1\27[0m ")  -- green
  highlighted = highlighted:gsub("(if)%s+", "\27[33m%1\27[0m ")  -- yellow
  highlighted = highlighted:gsub("(else)%s+", "\27[33m%1\27[0m ")  -- yellow
  highlighted = highlighted:gsub("(True)", "\27[34m%1\27[0m")  -- blue
  highlighted = highlighted:gsub("(False)", "\27[34m%1\27[0m")  -- blue
  
  -- Strings
  highlighted = highlighted:gsub('("[^"]*")', "\27[32m%1\27[0m")  -- green
  highlighted = highlighted:gsub("(')[^']*(')", "\27[32m%1\27[0m")  -- green
  
  -- Comments
  highlighted = highlighted:gsub("--[^\n]*", "\27[90m%1\27[0m")  -- gray
  
  -- Types
  highlighted = highlighted:gsub("(LSApp)", "\27[36m%1\27[0m")  -- cyan
  highlighted = highlighted:gsub("(LSWidget)", "\27[36m%1\27[0m")  -- cyan
  highlighted = highlighted:gsub("(LSString)", "\27[36m%1\27[0m")  -- cyan
  highlighted = highlighted:gsub("(LSDouble)", "\27[36m%1\27[0m")  -- cyan
  
  return highlighted
end

function Editor.get_line_numbers(content)
  local lines = Utils.split(content, "\n")
  local line_numbers = {}
  for i = 1, #lines do
    line_numbers[i] = tostring(i)
  end
  return line_numbers
end

return Editor
