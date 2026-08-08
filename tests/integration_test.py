#!/usr/bin/env python3
"""
Integration test for Rcode
Tests the integration between Rcode and lc_lang
"""

import os
import sys
import subprocess
import tempfile
import json

def test_lc_lang_integration():
    """Test that Rcode can integrate with lc_lang"""
    
    # Check if lc_lang exists
    lc_lang_path = os.path.join(os.path.dirname(__file__), '..', '..', 'lc_lang')
    if not os.path.exists(lc_lang_path):
        print("Warning: lc_lang directory not found. Some tests may fail.")
        return False
    
    # Test that we can import lc_lang modules
    print("Testing lc_lang integration...")
    
    # Create a simple test script that uses lc_lang
    test_script = """
local root = "../lc_lang/src/?.lua;../lc_lang/src/?/init.lua;"
package.path = root .. package.path

local Compiler = require("lc.compiler.compiler")
local Source = require("lc.common.source")

-- Test parsing a simple LC-lang file
local text = [[
pub fn main() -> Result() {
  let x = 10
  return Ok(x)
}
]]

local result = Compiler.compile(text)
if result and result.ast then
  print("SUCCESS: lc_lang integration works")
  return true
else
  print("FAILED: Could not parse LC-lang code")
  return false
end
"""
    
    # Write test script to temp file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.lua', delete=False) as f:
        f.write(test_script)
        temp_script = f.name
    
    try:
        # Try to run with Lua
        for lua_cmd in ['luajit', 'lua5.4', 'lua5.3', 'lua5.2', 'lua5.1', 'lua']:
            try:
                result = subprocess.run([lua_cmd, temp_script],
                                      capture_output=True, text=True, timeout=10,
                                      cwd=os.path.dirname(temp_script))
                if result.returncode == 0:
                    print(result.stdout)
                    if "SUCCESS" in result.stdout:
                        return True
                elif result.stderr:
                    print(f"Error with {lua_cmd}: {result.stderr}")
            except FileNotFoundError:
                pass
        
        print("No Lua interpreter found or integration test failed")
        return False
        
    finally:
        os.unlink(temp_script)

def test_rcode_structure():
    """Test that Rcode has the correct structure"""
    
    print("\nTesting Rcode structure...")
    
    required_files = [
        'src/rcode.lua',
        'src/rcode/init.lua',
        'src/rcode/cli/main.lua',
        'src/rcode/parser/lc_parser.lua',
        'src/rcode/runner/executor.lua',
        'src/rcode/editor/core.lua',
        'src/rcode/ui/tui.lua',
        'src/rcode/ui/repl.lua',
        'src/rcode/utils/helpers.lua',
        'src/rcode/config/settings.lua',
        'examples/hello_world.lc',
        'examples/basics.lc',
        'tests/test_rcode.lua',
    ]
    
    base_path = os.path.dirname(__file__)
    all_exist = True
    
    for file in required_files:
        filepath = os.path.join(base_path, '..', file)
        if not os.path.exists(filepath):
            print(f"  MISSING: {file}")
            all_exist = False
        else:
            print(f"  OK: {file}")
    
    return all_exist

def test_example_files():
    """Test that example files are valid"""
    
    print("\nTesting example files...")
    
    examples_dir = os.path.join(os.path.dirname(__file__), '..', 'examples')
    if not os.path.exists(examples_dir):
        print("  Examples directory not found")
        return False
    
    # List all .lc files
    lc_files = []
    for file in os.listdir(examples_dir):
        if file.endswith('.lc'):
            lc_files.append(file)
    
    if not lc_files:
        print("  No .lc files found in examples")
        return False
    
    print(f"  Found {len(lc_files)} example files: {', '.join(lc_files)}")
    
    # Try to parse each file with lc_lang if available
    lc_lang_path = os.path.join(os.path.dirname(__file__), '..', '..', 'lc_lang')
    if os.path.exists(lc_lang_path):
        print("  Testing parsing with lc_lang...")
        
        for lc_file in lc_files:
            filepath = os.path.join(examples_dir, lc_file)
            test_script = f"""
local root = "../../lc_lang/src/?.lua;../../lc_lang/src/?/init.lua;"
package.path = root .. package.path

local Compiler = require("lc.compiler.compiler")
local Source = require("lc.common.source")

local text, err = Source.read("{filepath}")
if not text then
  print("ERROR: Could not read {lc_file}")
  return false
end

local result = Compiler.compile(text)
if result and result.ast then
  print("OK: {lc_file} parsed successfully")
  return true
else
  print("ERROR: {lc_file} failed to parse")
  if result and result.analysis and result.analysis.errors then
    for _, err in ipairs(result.analysis.errors) do
      print("  ", err)
    end
  end
  return false
end
"""
            
            with tempfile.NamedTemporaryFile(mode='w', suffix='.lua', delete=False) as f:
                f.write(test_script)
                temp_script = f.name
            
            try:
                for lua_cmd in ['luajit', 'lua5.4', 'lua5.3', 'lua5.2', 'lua5.1', 'lua']:
                    try:
                        result = subprocess.run([lua_cmd, temp_script],
                                              capture_output=True, text=True, timeout=10,
                                              cwd=os.path.dirname(temp_script))
                        if result.returncode == 0:
                            print(f"    {result.stdout.strip()}")
                            break
                    except FileNotFoundError:
                        pass
            finally:
                os.unlink(temp_script)
    else:
        print("  lc_lang not available, skipping parse tests")
    
    return True

def main():
    print("=" * 60)
    print("Rcode Integration Test Suite")
    print("=" * 60)
    
    results = []
    
    # Run tests
    results.append(("Structure", test_rcode_structure()))
    results.append(("Examples", test_example_files()))
    results.append(("Integration", test_lc_lang_integration()))
    
    # Print summary
    print("\n" + "=" * 60)
    print("Test Summary")
    print("=" * 60)
    
    for name, passed in results:
        status = "PASSED" if passed else "FAILED"
        print(f"{name}: {status}")
    
    all_passed = all(passed for _, passed in results)
    
    if all_passed:
        print("\n✓ All tests passed!")
        return 0
    else:
        print("\n✗ Some tests failed")
        return 1

if __name__ == '__main__':
    sys.exit(main())
