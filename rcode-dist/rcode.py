#!/usr/bin/env python3
"""
Rcode Python Launcher
Falls back to using LuaJIT if available, otherwise uses this wrapper
"""

import subprocess
import sys
import os

# Try to find LuaJIT
lua_commands = ['luajit', './luajit', './luajit.exe', 'lua5.1', 'lua5.2', 'lua5.3', 'lua5.4']
script_dir = os.path.dirname(os.path.abspath(__file__))

for cmd in lua_commands:
    lua_path = os.path.join(script_dir, cmd) if cmd.startswith('./') else cmd
    try:
        # Test if the command exists
        result = subprocess.run([lua_path, '--version'], 
                              capture_output=True, timeout=5, 
                              stderr=subprocess.DEVNULL)
        if result.returncode == 0:
            # If we get here, the command exists
            result = subprocess.run(
                [lua_path, os.path.join(script_dir, 'rcode.lua')] + sys.argv[1:],
                cwd=script_dir
            )
            sys.exit(result.returncode)
    except:
        pass

print("Error: LuaJIT not found. Please install LuaJIT or run with: luajit rcode.lua")
print("Download LuaJIT from: https://luajit.org/")
sys.exit(1)
