--[[
Rcode Terminal User Interface Module
Provides a simple TUI for editing files
]]

local TUI = {}
local Parser = require("rcode.parser.lc_parser")
local Editor = require("rcode.editor.core")
local Utils = require("rcode.utils.helpers")

function TUI.clear_screen()
  io.write("\27[2J")  -- Clear screen
  io.write("\27[H")   -- Move cursor to home position
end

function TUI.show_status(message)
  io.write("\27[30;47m")  -- Black text on white background
  io.write(string.format(" %s ", message))
  io.write("\27[0m")    -- Reset
end

function TUI.show_error(message)
  io.write("\27[37;41m")  -- White text on red background
  io.write(string.format(" ERROR: %s ", message))
  io.write("\27[0m")    -- Reset
end

function TUI.display_file(filepath, content, cursor_line, cursor_col)
  TUI.clear_screen()
  
  local lines = Utils.split(content, "\n")
  local line_numbers = Editor.get_line_numbers(content)
  local highlighted_lines = Editor.get_syntax_highlighting(content)
  
  -- Display header
  print(string.format("Rcode - %s", filepath))
  print(string.rep("-", 80))
  
  -- Display line numbers and content
  for i, line in ipairs(lines) do
    local line_num = tostring(i)
    local highlighted = highlighted_lines[i] or line
    
    -- Highlight current line
    if i == cursor_line then
      io.write("\27[44m")  -- Blue background
    end
    
    -- Line number
    io.write(string.format("%-4s ", line_num))
    
    -- Content
    print(highlighted)
    
    if i == cursor_line then
      io.write("\27[0m")  -- Reset
    end
  end
  
  -- Display status
  print(string.rep("-", 80))
  print(string.format("Line: %d, Col: %d | %s", cursor_line, cursor_col, filepath))
end

function TUI.start_editor(filepath, content, is_new)
  local lines = Utils.split(content, "\n")
  local cursor_line = 1
  local cursor_col = 1
  local modified = false
  
  -- Main editor loop
  while true do
    TUI.display_file(filepath, content, cursor_line, cursor_col)
    
    -- Get user input
    io.write(":")
    local command = io.read()
    
    if not command then
      break
    end
    
    -- Handle commands
    if command == "q" then
      if modified then
        io.write("Save changes? (y/n): ")
        local answer = io.read()
        if answer == "y" then
          Utils.write_file(filepath, content)
        end
      end
      break
    elseif command == "w" then
      local success, err = Utils.write_file(filepath, content)
      if success then
        print("File saved")
        modified = false
      else
        print(string.format("Error saving: %s", err))
      end
    elseif command == "validate" or command == "check" then
      local valid, errors = Parser.validate_syntax(content)
      if valid then
        print("File is valid LC-lang code")
      else
        print("Validation errors:")
        for _, err in ipairs(errors) do
          print(string.format("  - %s", err))
        end
      end
      io.read()  -- Wait for user to press enter
    elseif command:match("^%d+$") then
      -- Go to line
      cursor_line = tonumber(command)
      if cursor_line > #lines then
        cursor_line = #lines
      end
    elseif command:match("^%d+,%d+$") then
      -- Go to line and column
      local line, col = command:match("(%d+),(%d+)")
      cursor_line = tonumber(line)
      cursor_col = tonumber(col)
      if cursor_line > #lines then
        cursor_line = #lines
      end
    elseif command == "parse" then
      local result, err = Parser.parse_text(content)
      if result then
        print("AST:")
        print(Utils.json_encode(result.ast))
      else
        print(string.format("Parse error: %s", err))
      end
      io.read()  -- Wait for user
    elseif command == "help" then
      print([[
Editor Commands:
  :q          - Quit
  :w          - Save
  :validate   - Validate syntax
  :check      - Check for errors
  :parse      - Show AST
  :<line>     - Go to line
  :<line>,<col> - Go to line and column
  :help       - Show this help
]])
      io.read()
    else
      print("Unknown command. Type :help for available commands")
      io.read()
    end
  end
end

return TUI
