#!/usr/bin/env python3
"""
Rcode Distribution Builder
Creates a standalone, downloadable package with all dependencies
"""

import os
import sys
import shutil
import subprocess
import platform
import zipfile
import tarfile
from pathlib import Path

class DistributionBuilder:
    def __init__(self):
        self.base_dir = Path(__file__).parent.parent
        self.output_dir = self.base_dir / "rcode-dist"
        self.lc_lang_dir = self.base_dir.parent / "lc_lang"
        
    def create_directory(self, path):
        """Create a directory if it doesn't exist"""
        path.mkdir(parents=True, exist_ok=True)
        
    def copy_file(self, src, dst):
        """Copy a file from src to dst"""
        shutil.copy2(src, dst)
        
    def copy_tree(self, src, dst):
        """Copy a directory tree"""
        if src.exists():
            shutil.copytree(src, dst, dirs_exist_ok=True)
    
    def create_lua_launcher(self):
        """Create a Lua launcher script"""
        launcher = """#!/usr/bin/env luajit
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
"""
        return launcher
    
    def create_batch_launcher(self):
        """Create a Windows batch launcher"""
        batch = """@echo off
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
"""
        return batch
    
    def create_shell_launcher(self):
        """Create a Unix shell launcher"""
        shell = """#!/bin/bash
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
"""
        return shell
    
    def create_python_launcher(self):
        """Create a Python launcher as fallback"""
        python = """#!/usr/bin/env python3
\"\"\"
Rcode Python Launcher
Falls back to using LuaJIT if available, otherwise uses this wrapper
\"\"\"

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
"""
        return python
    
    def create_readme(self):
        """Create README for the distribution"""
        readme = f"""# Rcode - Standalone Distribution

This is a standalone, portable distribution of **Rcode - The Ultimate IDE for LC-lang**.

## 📊 What's Included

- **Rcode IDE**: Complete IDE with 614+ files
- **All Modules**: Core, plugins, editor, UI, project, utils, etc.
- **Examples**: 23+ LC-lang example files
- **Documentation**: 22+ documentation files
- **Launchers**: Scripts for Windows, Linux, macOS, and Python

## 🚀 Quick Start

### Windows
1. Download and extract the zip file
2. Double-click `rcode.bat` or run from command prompt:
   ```cmd
   rcode.bat help
   rcode.bat edit myfile.lc
   ```

### Linux/macOS
1. Download and extract the tar.gz file
2. Make the launcher executable and run:
   ```bash
   chmod +x rcode.sh
   ./rcode.sh help
   ./rcode.sh edit myfile.lc
   ```

Or use the Python launcher (no LuaJIT installation needed):
```bash
python3 rcode.py help
```

## 📦 Requirements

### For Full Functionality
- **LuaJIT** (recommended) or **Lua 5.1+**
  - Download: https://luajit.org/
  - Installation: See platform-specific instructions below

### Optional
- **lc_lang** repository (included in this distribution)

## 🎯 Usage

### Available Commands
```bash
# Show help
./rcode.sh help

# Edit a file interactively
./rcode.sh edit examples/hello_world.lc

# Parse and show AST
./rcode.sh parse examples/hello_world.lc

# Validate a file
./rcode.sh check examples/hello_world.lc

# Run an LC-lang program
./rcode.sh run examples/hello_world.lc

# Generate manifest from Lemon Studio app
./rcode.sh manifest examples/lemon_app.lc

# Start interactive REPL
./rcode.sh repl

# Show version
./rcode.sh version
```

### Editor Commands
When editing a file, use these commands:
- `:q` - Quit editor
- `:w` - Save file
- `:validate` - Validate syntax
- `:check` - Check for errors
- `:parse` - Show AST
- `:<line>` - Go to line number
- `:<line>,<col>` - Go to line and column
- `:help` - Show editor help

### REPL Commands
In the REPL mode:
- `exit`, `quit` - Exit REPL
- `help` - Show REPL help
- `clear` - Clear screen
- Any LC-lang code - Execute the code

## 📁 Directory Structure

```
rcode-dist/
├── rcode.lua              # Main entry point (Lua launcher)
├── rcode.bat              # Windows batch launcher
├── rcode.sh               # Unix/Linux shell launcher
├── rcode.py               # Python launcher (fallback)
├── src/                   # Rcode source code (543 Lua files)
│   └── rcode/             # All Rcode modules
│       ├── core/          # Core infrastructure
│       ├── plugins/       # Plugin system (40+ plugins)
│       ├── editor/        # Editor modules (50+)
│       ├── ui/            # UI modules (30+)
│       ├── project/       # Project management
│       ├── utils/         # Utility modules
│       ├── language/      # Language support
│       ├── tests/         # Testing framework
│       └── ...
├── lc_lang/               # LC-lang dependency (included)
│   └── src/               # LC-lang source code
├── examples/              # Example LC-lang files (23 files)
│   ├── hello_world.lc
│   ├── basics.lc
│   ├── calculator.lc
│   └── ...
├── docs/                  # Documentation (22 files)
│   ├── architecture/
│   ├── guides/
│   ├── tutorials/
│   └── reference/
├── data/                  # Data files (20+ files)
│   ├── schemas/
│   ├── templates/
│   ├── snippets/
│   └── configs/
├── README_DIST.md         # This file
└── LICENSE                # License file
```

## 🔧 Installing LuaJIT

### Windows
1. Download LuaJIT from: https://luajit.org/download.html
2. Extract the zip file
3. Copy `luajit.exe` to the `rcode-dist` directory
4. Or add LuaJIT to your PATH

### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install luajit
```

### macOS (Homebrew)
```bash
brew install luajit
```

### From Source
```bash
git clone https://github.com/LuaJIT/LuaJIT.git
cd LuaJIT
make && sudo make install
```

## 🐍 Using Without LuaJIT

If you don't have LuaJIT installed, you can use the Python launcher:
```bash
python3 rcode.py help
python3 rcode.py edit examples/hello_world.lc
```


## :computer: Examples

See the `examples/` directory for complete examples:
- `hello_world.lc` - Lemon Studio app example
- `basics.lc` - Basic LC-lang features
- `calculator.lc` - Calculator example
- And 20+ more examples


- **Repository**: https://github.com/Lemon-Enterprise/Rcode
- **Issues**: https://github.com/Lemon-Enterprise/Rcode/issues
- **Documentation**: See the `docs/` directory

---

**Rcode - The Ultimate IDE for LC-lang**

*Powered by LuaJIT and Lemon Code Language*
*614+ files | 50+ modules | 40+ plugins | 100+ tests*
"""
        return readme
    
    def build(self):
        """Build the distribution"""
        print("=" * 60)
        print("Rcode Distribution Builder")
        print("=" * 60)
        print()
        
        # Create output directory
        print(f"Creating output directory: {self.output_dir}")
        self.create_directory(self.output_dir)
        
        # Copy Rcode source
        print("Copying Rcode source code...")
        self.copy_tree(self.base_dir / "src", self.output_dir / "src")
        
        # Copy examples
        print("Copying examples...")
        self.copy_tree(self.base_dir / "examples", self.output_dir / "examples")
        
        # Copy docs
        print("Copying documentation...")
        self.copy_tree(self.base_dir / "docs", self.output_dir / "docs")
        
        # Copy data
        print("Copying data files...")
        self.copy_tree(self.base_dir / "data", self.output_dir / "data")
        
        # Copy lc_lang if available
        if self.lc_lang_dir.exists():
            print("Copying lc_lang dependency...")
            self.copy_tree(self.lc_lang_dir / "src", self.output_dir / "lc_lang" / "src")
        
        # Copy other files
        print("Copying other files...")
        self.copy_file(self.base_dir / "README.md", self.output_dir / "README.md")
        self.copy_file(self.base_dir / "LICENSE", self.output_dir / "LICENSE")
        self.copy_file(self.base_dir / "Makefile", self.output_dir / "Makefile")
        
        # Create launchers
        print("Creating launchers...")
        
        # Lua launcher
        lua_launcher = self.create_lua_launcher()
        with open(self.output_dir / "rcode.lua", "w") as f:
            f.write(lua_launcher)
        
        # Windows batch launcher
        batch_launcher = self.create_batch_launcher()
        with open(self.output_dir / "rcode.bat", "w") as f:
            f.write(batch_launcher)
        
        # Unix shell launcher
        shell_launcher = self.create_shell_launcher()
        with open(self.output_dir / "rcode.sh", "w") as f:
            f.write(shell_launcher)
        os.chmod(self.output_dir / "rcode.sh", 0o755)
        
        # Python launcher
        python_launcher = self.create_python_launcher()
        with open(self.output_dir / "rcode.py", "w") as f:
            f.write(python_launcher)
        os.chmod(self.output_dir / "rcode.py", 0o755)
        
        # Create README for distribution
        readme = self.create_readme()
        with open(self.output_dir / "README_DIST.md", "w") as f:
            f.write(readme)
        
        print()
        print("✓ Distribution build complete!")
        print()
        print(f"Distribution created in: {self.output_dir}")
        print()
        
        # Count files
        total_files = sum(1 for _ in self.output_dir.rglob("*") if _.is_file())
        print(f"Total files in distribution: {total_files}")
        print()
        
        # Create archives
        self.create_archives()
        
        return self.output_dir
    
    def create_archives(self):
        """Create zip and tar.gz archives"""
        print("Creating archives...")
        
        # Create zip archive
        zip_path = self.base_dir / "rcode-dist.zip"
        print(f"Creating {zip_path}...")
        with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for file in self.output_dir.rglob("*"):
                if file.is_file():
                    arcname = file.relative_to(self.output_dir)
                    zipf.write(file, arcname)
        print(f"✓ Created {zip_path}")
        
        # Create tar.gz archive
        tar_path = self.base_dir / "rcode-dist.tar.gz"
        print(f"Creating {tar_path}...")
        with tarfile.open(tar_path, "w:gz") as tar:
            for file in self.output_dir.rglob("*"):
                if file.is_file():
                    arcname = file.relative_to(self.output_dir)
                    tar.add(file, arcname=arcname)
        print(f"✓ Created {tar_path}")
        
        print()
        print("=" * 60)
        print("Build Complete!")
        print("=" * 60)
        print()
        print("Archives created:")
        print(f"  - {self.base_dir / 'rcode-dist.zip'}")
        print(f"  - {self.base_dir / 'rcode-dist.tar.gz'}")
        print()
        print("To download and use:")
        print("  1. Download rcode-dist.zip (Windows) or rcode-dist.tar.gz (Linux/macOS)")
        print("  2. Extract the archive")
        print("  3. Run:")
        print("     - Windows: double-click rcode.bat or run: rcode.bat help")
        print("     - Linux/macOS: chmod +x rcode.sh && ./rcode.sh help")
        print("     - Or: python3 rcode.py help")
        print()

if __name__ == "__main__":
    builder = DistributionBuilder()
    builder.build()
