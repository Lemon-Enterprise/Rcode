# Rcode - Standalone Distribution

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
