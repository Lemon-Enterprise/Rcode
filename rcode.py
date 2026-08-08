#!/usr/bin/env python3
"""
Rcode - Python wrapper for the LuaJIT-based IDE
This allows running Rcode even when LuaJIT is not directly available
"""

import subprocess
import sys
import os
import json
import argparse

# Try to find LuaJIT or Lua
LUA_COMMANDS = ['luajit', 'lua5.4', 'lua5.3', 'lua5.2', 'lua5.1', 'lua']

def find_lua():
    """Find an available Lua interpreter"""
    for cmd in LUA_COMMANDS:
        try:
            result = subprocess.run([cmd, '--version'], 
                                  capture_output=True, text=True, timeout=5)
            if result.returncode == 0:
                return cmd
        except:
            pass
    return None

def run_lua_script(script_path, args):
    """Run a Lua script with arguments"""
    lua_cmd = find_lua()
    if not lua_cmd:
        print("Error: No Lua interpreter found. Please install LuaJIT or Lua 5.1+")
        print("Available commands tried:", ', '.join(LUA_COMMANDS))
        return False
    
    # Set up the path to include lc_lang
    env = os.environ.copy()
    env['LUA_PATH'] = '../lc_lang/src/?.lua;../lc_lang/src/?/init.lua;' + env.get('LUA_PATH', '')
    
    cmd = [lua_cmd, script_path] + args
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, 
                              cwd=os.path.dirname(script_path), env=env)
        print(result.stdout)
        if result.stderr:
            print(result.stderr, file=sys.stderr)
        return result.returncode == 0
    except Exception as e:
        print(f"Error running script: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(
        description='Rcode - The Ultimate IDE for LC-lang',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 rcode.py help
  python3 rcode.py edit examples/hello_world.lc
  python3 rcode.py parse examples/hello_world.lc
  python3 rcode.py check examples/hello_world.lc
  python3 rcode.py run examples/hello_world.lc
  python3 rcode.py manifest examples/lemon_app.lc
  python3 rcode.py repl
  python3 rcode.py version
"""
    )
    
    parser.add_argument('command', nargs='?', default='help',
                       choices=['help', 'edit', 'parse', 'check', 'run', 'manifest', 'repl', 'version'],
                       help='Command to execute')
    parser.add_argument('file', nargs='?', help='File to process')
    parser.add_argument('--lua', help='Path to Lua interpreter')
    
    args = parser.parse_args()
    
    # Build command arguments
    lua_args = []
    if args.command:
        lua_args.append(args.command)
    if args.file:
        lua_args.append(args.file)
    
    # Find the script path
    script_path = os.path.join(os.path.dirname(__file__), 'src', 'rcode.lua')
    
    if not os.path.exists(script_path):
        print(f"Error: Cannot find rcode.lua at {script_path}")
        print("Please run this script from the Rcode directory")
        return 1
    
    # Run the Lua script
    success = run_lua_script(script_path, lua_args)
    return 0 if success else 1

if __name__ == '__main__':
    sys.exit(main())
