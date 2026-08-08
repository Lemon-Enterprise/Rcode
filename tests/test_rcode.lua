--[[
Rcode Test Suite
Tests for the Rcode IDE functionality
]]

local Test = {}
local Parser = require("rcode.parser.lc_parser")
local Executor = require("rcode.runner.executor")
local Editor = require("rcode.editor.core")
local Utils = require("rcode.utils.helpers")

function Test.run_all()
  print("Running Rcode tests...")
  print(string.rep("=", 50))
  
  local passed = 0
  local failed = 0
  
  -- Test parser
  print("\n[Testing Parser]")
  if Test.test_parser() then
    passed = passed + 1
    print("✓ Parser tests passed")
  else
    failed = failed + 1
    print("✗ Parser tests failed")
  end
  
  -- Test executor
  print("\n[Testing Executor]")
  if Test.test_executor() then
    passed = passed + 1
    print("✓ Executor tests passed")
  else
    failed = failed + 1
    print("✗ Executor tests failed")
  end
  
  -- Test utils
  print("\n[Testing Utils]")
  if Test.test_utils() then
    passed = passed + 1
    print("✓ Utils tests passed")
  else
    failed = failed + 1
    print("✗ Utils tests failed")
  end
  
  -- Test editor
  print("\n[Testing Editor]")
  if Test.test_editor() then
    passed = passed + 1
    print("✓ Editor tests passed")
  else
    failed = failed + 1
    print("✗ Editor tests failed")
  end
  
  print(string.rep("=", 50))
  print(string.format("Tests complete: %d passed, %d failed", passed, failed))
  
  return failed == 0
end

function Test.test_parser()
  -- Test parsing valid LC-lang code
  local valid_code = [[
pub fn main() -> Result() {
  let x = 10
  return Ok(x)
}
]]
  
  local result, err = Parser.parse_text(valid_code)
  if not result then
    print(string.format("  Parse error: %s", err))
    return false
  end
  
  if not result.ast then
    print("  No AST returned")
    return false
  end
  
  -- Test validation
  local valid, errors = Parser.validate_syntax(valid_code)
  if not valid then
    print(string.format("  Validation failed: %s", table.concat(errors, ", ")))
    return false
  end
  
  return true
end

function Test.test_executor()
  -- Test simple execution
  local code = [[
pub fn main() -> Result() {
  let x = 5
  let y = 10
  let sum = x + y
  return Ok(sum)
}
]]
  
  local result, err = Executor.execute_text(code)
  if not result then
    print(string.format("  Execution error: %s", err))
    return false
  end
  
  if not result.success then
    print("  Execution not successful")
    return false
  end
  
  return true
end

function Test.test_utils()
  -- Test file operations
  local test_file = "test_file.txt"
  local test_content = "Hello, World!"
  
  -- Write file
  local success, err = Utils.write_file(test_file, test_content)
  if not success then
    print(string.format("  Write error: %s", err))
    return false
  end
  
  -- Read file
  local content, err = Utils.read_file(test_file)
  if not content then
    print(string.format("  Read error: %s", err))
    os.remove(test_file)
    return false
  end
  
  if content ~= test_content then
    print("  Content mismatch")
    os.remove(test_file)
    return false
  end
  
  -- Clean up
  os.remove(test_file)
  
  -- Test split
  local parts = Utils.split("a,b,c", ",")
  if #parts ~= 3 or parts[1] ~= "a" or parts[2] ~= "b" or parts[3] ~= "c" then
    print("  Split test failed")
    return false
  end
  
  return true
end

function Test.test_editor()
  -- Test syntax highlighting
  local line = "pub fn main() -> Result() { let x = 10 }"
  local highlighted = Editor.highlight_line(line)
  
  if not highlighted then
    print("  Highlighting failed")
    return false
  end
  
  -- Test line numbers
  local content = "line1\nline2\nline3"
  local line_numbers = Editor.get_line_numbers(content)
  
  if #line_numbers ~= 3 or line_numbers[1] ~= "1" or line_numbers[2] ~= "2" then
    print("  Line numbers test failed")
    return false
  end
  
  return true
end

-- Run tests if this file is executed directly
if arg and arg[0]:find("test_rcode.lua") then
  local success = Test.run_all()
  os.exit(success and 0 or 1)
end

return Test
