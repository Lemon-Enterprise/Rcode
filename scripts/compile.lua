--[[
Rcode Compilation Script
Creates a standalone executable package
]]

local lfs = require("lfs")
local json = require("cjson") or require("dkjson") or require("json")

local Compile = {}

function Compile.create_directory(path)
  local success, err = os.execute("mkdir -p " .. path)
  if not success then
    os.execute("md " .. path)
  end
end

function Compile.copy_file(src, dst)
  local src_file = io.open(src, "rb")
  if not src_file then return false end
  
  local dst_file = io.open(dst, "wb")
  if not dst_file then
    src_file:close()
    return false
  end
  
  dst_file:write(src_file:read("*a"))
  src_file:close()
  dst_file:close()
  return true
end

function Compile.copy_directory(src, dst)
  Compile.create_directory(dst)
  
  for file in lfs.dir(src) do
    if file ~= "." and file ~= ".." then
      local src_path = src .. "/" .. file
      local dst_path = dst .. "/" .. file
      
      local attr = lfs.attributes(src_path)
      if attr.mode == "directory" then
        Compile.copy_directory(src_path, dst_path)
      else
        Compile.copy_file(src_path, dst_path)
      end
    end
  end
end

function Compile.create_lua_launcher()
  local launcher = [[
#!/usr/bin/env luajit
-- Rcode Launcher
-- This script sets up the environment and launches Rcode

local root = "?/.lua;?/init.lua;"
local rcode_path = "rcode/?.lua;rcode/?/init.lua;"

-- Add current directory to package path
package.path = "./" .. rcode_path .. root .. package.path

-- Add lc_lang to path (if available)
package.path = "./lc_lang/src/?.lua;" .. package.path

-- Load and run Rcode
local success, err = pcall(function()
  require("rcode").run(arg)
end)

if not success then
  print("Error: " .. tostring(err))
  os.exit(1)
end
]]
  
  return launcher
end

function Compile.create_batch_launcher()
  local batch = [[
@echo off
setlocal

:: Rcode Launcher for Windows
:: This batch file launches Rcode with LuaJIT

set SCRIPT_DIR=%~dp0
set LUAJIT=%SCRIPT_DIR%luajit.exe

if not exist "%LUAJIT%" (
    echo LuaJIT not found in distribution directory
    echo Trying to use system LuaJIT...
    set LUAJIT=luajit
)

%LUAJIT% "%SCRIPT_DIR%rcode.lua" %*
]]
  
  return batch
end

function Compile.create_shell_launcher()
  local shell = [[#!/bin/bash
# Rcode Launcher for Unix/Linux/macOS
# This script launches Rcode with LuaJIT

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LUAJIT="${SCRIPT_DIR}/luajit"

if [ ! -f "$LUAJIT" ]; then
    echo "LuaJIT not found in distribution directory"
    echo "Trying to use system LuaJIT..."
    LUAJIT="luajit"
fi

"$LUAJIT" "${SCRIPT_DIR}/rcode.lua" "$@"
]]
  
  return shell
end

function Compile.create_python_launcher()
  local python = [[#!/usr/bin/env python3
"""
Rcode Python Launcher
Falls back to using LuaJIT if available, otherwise uses this wrapper
"""

import subprocess
import sys
import os

# Try to find LuaJIT
lua_commands = ['luajit', './luajit', './luajit.exe']
script_dir = os.path.dirname(os.path.abspath(__file__))

for cmd in lua_commands:
    lua_path = os.path.join(script_dir, cmd) if cmd.startswith('./') else cmd
    try:
        # Test if the command exists
        subprocess.run([lua_path, '--version'], capture_output=True, timeout=5)
        # If we get here, the command exists
        result = subprocess.run(
            [lua_path, os.path.join(script_dir, 'rcode.lua')] + sys.argv[1:],
            cwd=script_dir
        )
        sys.exit(result.returncode)
    except:
        pass

print("Error: LuaJIT not found. Please install LuaJIT or run with: luajit rcode.lua")
sys.exit(1)
]]
  
  return python
end

function Compile.create_readme()
  return [[
# Rcode - Standalone Distribution

This is a standalone, portable distribution of Rcode - The Ultimate IDE for LC-lang.

## Quick Start

### Windows
Double-click `rcode.bat` or run from command prompt:
```cmd
rcode.bat help
rcode.bat edit myfile.lc
```

### Linux/macOS
Make the launcher executable and run:
```bash
chmod +x rcode.sh
./rcode.sh help
./rcode.sh edit myfile.lc
```

Or use the Python launcher:
```bash
python3 rcode.py help
```

## Requirements

- LuaJIT (included in this distribution or install separately)
- For full functionality: lc_lang repository (included)

## Usage

```bash
# Show help
./rcode.sh help

# Edit a file
./rcode.sh edit examples/hello_world.lc

# Parse and show AST
./rcode.sh parse examples/hello_world.lc

# Validate a file
./rcode.sh check examples/hello_world.lc

# Run an LC-lang program
./rcode.sh run examples/hello_world.lc

# Start REPL
./rcode.sh repl
```

## Directory Structure

```
rcode-dist/
├── rcode.lua              # Main entry point
├── rcode.bat              # Windows launcher
├── rcode.sh               # Unix/Linux launcher
├── rcode.py               # Python launcher (fallback)
├── luajit                 # LuaJIT executable (if included)
├── src/                   # Rcode source code
│   └── rcode/             # All Rcode modules
├── lc_lang/               # LC-lang dependency
│   └── src/               # LC-lang source
├── examples/              # Example LC-lang files
├── docs/                  # Documentation
└── README.md              # This file
```

## Troubleshooting

If you get errors about missing LuaJIT:
1. Install LuaJIT from https://luajit.org/
2. Or place luajit/luajit.exe in this directory
3. Or add LuaJIT to your PATH

## License

MIT License - See LICENSE for details.
]]
end

function Compile.create_zip_archive(output_path, base_dir)
  -- This would use zip command if available
  local command = string.format("cd %s && zip -r %s *", base_dir, output_path)
  local success = os.execute(command)
  return success == 0
end

function Compile.create_tar_gz_archive(output_path, base_dir)
  local command = string.format("cd %s && tar -czf %s *", base_dir, output_path)
  local success = os.execute(command)
  return success == 0
end

function Compile.run(output_dir)
  output_dir = output_dir or "./rcode-dist"
  
  print("Rcode Compilation Script")
  print("========================")
  print()
  
  -- Create output directory
  print("Creating output directory: " .. output_dir)
  Compile.create_directory(output_dir)
  
  -- Copy Rcode source
  print("Copying Rcode source code...")
  Compile.copy_directory("./src", output_dir .. "/src")
  Compile.copy_directory("./examples", output_dir .. "/examples")
  Compile.copy_directory("./docs", output_dir .. "/docs")
  Compile.copy_directory("./data", output_dir .. "/data")
  
  -- Copy lc_lang if available
  if lfs.attributes("./../lc_lang") then
    print("Copying lc_lang dependency...")
    Compile.copy_directory("./../lc_lang", output_dir .. "/lc_lang")
  end
  
  -- Copy other files
  print("Copying other files...")
  Compile.copy_file("./README.md", output_dir .. "/README.md")
  Compile.copy_file("./LICENSE", output_dir .. "/LICENSE")
  Compile.copy_file("./Makefile", output_dir .. "/Makefile")
  Compile.copy_file("./rcode.py", output_dir .. "/rcode.py")
  
  -- Create launchers
  print("Creating launchers...")
  
  -- Lua launcher
  local lua_launcher = Compile.create_lua_launcher()
  local launcher_file = io.open(output_dir .. "/rcode.lua", "w")
  launcher_file:write(lua_launcher)
  launcher_file:close()
  
  -- Windows batch launcher
  local batch_launcher = Compile.create_batch_launcher()
  local batch_file = io.open(output_dir .. "/rcode.bat", "w")
  batch_file:write(batch_launcher)
  batch_file:close()
  
  -- Unix shell launcher
  local shell_launcher = Compile.create_shell_launcher()
  local shell_file = io.open(output_dir .. "/rcode.sh", "w")
  shell_file:write(shell_launcher)
  shell_file:close()
  os.execute("chmod +x " .. output_dir .. "/rcode.sh")
  
  -- Python launcher
  local python_launcher = Compile.create_python_launcher()
  local python_file = io.open(output_dir .. "/rcode.py", "w")
  python_file:write(python_launcher)
  python_file:close()
  os.execute("chmod +x " .. output_dir .. "/rcode.py")
  
  -- Create README for distribution
  local readme = Compile.create_readme()
  local readme_file = io.open(output_dir .. "/README_DIST.md", "w")
  readme_file:write(readme)
  readme_file:close()
  
  print()
  print("✓ Compilation complete!")
  print()
  print("Distribution created in: " .. output_dir)
  print()
  print("To create a zip archive:")
  print("  cd " .. output_dir .. " && zip -r ../rcode-dist.zip *")
  print()
  print("To create a tar.gz archive:")
  print("  cd " .. output_dir .. " && tar -czf ../rcode-dist.tar.gz *")
  print()
  print("To run:")
  print("  Windows: double-click rcode.bat or run: rcode.bat help")
  print("  Linux/macOS: chmod +x rcode.sh && ./rcode.sh help")
  print("  Or: python3 rcode.py help")
end

-- Run compilation
Compile.run()
