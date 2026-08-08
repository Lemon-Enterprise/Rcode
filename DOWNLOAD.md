# 📥 Download and Install Rcode

Rcode is available for download and installation on Windows, Linux, and macOS. Choose the method that works best for you.

---

## 🌐 **Method 1: Clone from GitHub (Recommended for Developers)**

If you have Git installed, this is the easiest way to get the latest version:

```bash
# Clone the repository
git clone https://github.com/Lemon-Enterprise/Rcode.git
cd Rcode

# Clone the required lc_lang dependency
git clone https://github.com/Lemon-Enterprise/lc_lang.git

# Run Rcode
luajit src/rcode.lua help
```

---

## 📦 **Method 2: Download as ZIP (All Platforms)**

### Step 1: Download
Download the latest version as a ZIP file:
- 🔗 **[Download Rcode-main.zip](https://github.com/Lemon-Enterprise/Rcode/archive/refs/heads/main.zip)**

### Step 2: Extract
- **Windows**: Right-click the ZIP file and select "Extract All"
- **Linux/macOS**: Run `unzip Rcode-main.zip`

### Step 3: Install
After extracting, you'll have a folder called `Rcode-main`. Open a terminal/command prompt in that folder and run:

```bash
# Make sure you're in the Rcode-main directory
cd Rcode-main

# Clone the lc_lang dependency
git clone https://github.com/Lemon-Enterprise/lc_lang.git

# Run Rcode
luajit src/rcode.lua help
```

---

## 🪟 **Method 3: One-Click Install (Windows)**

### Using PowerShell
1. Download **[install.ps1](https://github.com/Lemon-Enterprise/Rcode/raw/main/install.ps1)**
2. Open PowerShell as Administrator
3. Run the installer:
   ```powershell
   # First, allow script execution (one time)
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   
   # Then run the installer
   .\install.ps1
   ```
4. The installer will download and set up Rcode automatically

### Manual Windows Setup
1. Download **[install.ps1](https://github.com/Lemon-Enterprise/Rcode/raw/main/install.ps1)**
2. Save it to your desired installation directory
3. Right-click the file and select "Run with PowerShell"
4. Follow the on-screen instructions

---

## 🐧 **Method 4: One-Click Install (Linux/macOS)**

### Using Terminal
1. Download and run the install script:
   ```bash
   # Download the install script
   curl -L -o install.sh https://github.com/Lemon-Enterprise/Rcode/raw/main/install.sh
   
   # Make it executable
   chmod +x install.sh
   
   # Run the installer
   ./install.sh
   ```
2. The installer will download and set up Rcode automatically

### Manual Linux/macOS Setup
```bash
# Download the repository
wget https://github.com/Lemon-Enterprise/Rcode/archive/refs/heads/main.zip
unzip main.zip
cd Rcode-main

# Clone lc_lang
git clone https://github.com/Lemon-Enterprise/lc_lang.git

# Make launchers executable
chmod +x install.sh
chmod +x scripts/download_and_run.py

# Run Rcode
luajit src/rcode.lua help
```

---

## 🐍 **Method 5: Python-Based Install (No Git Required)**

If you have Python 3 installed, you can use this method:

### Step 1: Download the Python installer
```bash
# Linux/macOS
curl -L -o download_and_run.py https://github.com/Lemon-Enterprise/Rcode/raw/main/scripts/download_and_run.py

# Windows (PowerShell)
Invoke-WebRequest -Uri "https://github.com/Lemon-Enterprise/Rcode/raw/main/scripts/download_and_run.py" -OutFile "download_and_run.py"
```

### Step 2: Run the installer
```bash
# Make it executable (Linux/macOS)
chmod +x download_and_run.py

# Run it
python3 download_and_run.py
```

The script will:
1. Download Rcode from GitHub
2. Extract it to a `rcode` directory
3. Create launchers for your platform
4. Show you how to run Rcode

---

## 🚀 **After Installation**

Once Rcode is installed, you can use it with these commands:

### Windows
```cmd
rcode.bat help
rcode.bat edit examples/hello_world.lc
rcode.bat parse examples/hello_world.lc
rcode.bat run examples/hello_world.lc
```

### Linux/macOS
```bash
# Make sure the launcher is executable
chmod +x rcode.sh

# Run Rcode
./rcode.sh help
./rcode.sh edit examples/hello_world.lc
./rcode.sh parse examples/hello_world.lc
./rcode.sh run examples/hello_world.lc

# Or use Python launcher
python3 rcode.py help
```

---

## 📋 **Available Commands**

| Command | Description |
|---------|-------------|
| `help` | Show this help message |
| `edit <file>` | Open file in interactive editor |
| `parse <file>` | Parse and show AST |
| `check <file>` | Validate file syntax |
| `run <file>` | Run LC-lang program |
| `manifest <file>` | Generate manifest from Lemon Studio app |
| `repl` | Start interactive REPL |
| `version` | Show version information |

---

## 🔧 **Requirements**

### Mandatory
- **LuaJIT** or **Lua 5.1+**
  - Download: https://luajit.org/
  - Installation guides:
    - **Windows**: Download from LuaJIT website
    - **Linux (Ubuntu/Debian)**: `sudo apt-get install luajit`
    - **macOS (Homebrew)**: `brew install luajit`

### Optional (for full functionality)
- **lc_lang** repository (included in the download or clone separately)
- **Git** (for cloning dependencies)
- **Python 3** (for using the Python launcher)

---

## ⚠️ **Troubleshooting**

### "LuaJIT not found" Error
If you see this error, you need to install LuaJIT:

**Windows:**
1. Download LuaJIT from https://luajit.org/download.html
2. Extract the ZIP file
3. Copy `luajit.exe` to the Rcode directory
4. Or add LuaJIT to your PATH

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get update
sudo apt-get install luajit
```

**macOS:**
```bash
brew install luajit
```

### "Module not found" Error
This usually means the lc_lang dependency is missing:
```bash
# Clone lc_lang in the same directory as Rcode
git clone https://github.com/Lemon-Enterprise/lc_lang.git
```

### "Permission denied" Error (Linux/macOS)
Make the launcher executable:
```bash
chmod +x rcode.sh
chmod +x rcode.py
```

---

## 📊 **What You Get**

When you download Rcode, you get:

- **614+ files** of well-structured code
- **543 Lua modules** - Core IDE functionality
- **23 LC-lang examples** - Ready-to-run examples
- **22 documentation files** - Comprehensive guides
- **40+ plugins** - Extensible architecture
- **100+ tests** - Robust test suite
- **Multiple launchers** - For Windows, Linux, macOS, and Python

---

## 🎯 **Quick Test**

After installation, test that everything works:

```bash
# Test help command
./rcode.sh help

# Test parsing an example
./rcode.sh parse examples/hello_world.lc

# Test running an example
./rcode.sh run examples/basics.lc
```

If all these commands work, your installation is successful! ✓

---

## 📚 **Next Steps**

1. **Read the documentation**: Check the `docs/` directory
2. **Try the examples**: Look at `examples/` for LC-lang examples
3. **Explore the code**: Browse `src/rcode/` to see the implementation
4. **Contribute**: Open issues or pull requests on GitHub

---

## 🔗 **Links**

- **Repository**: https://github.com/Lemon-Enterprise/Rcode
- **Issues**: https://github.com/Lemon-Enterprise/Rcode/issues
- **LC-lang**: https://github.com/Lemon-Enterprise/lc_lang
- **LuaJIT**: https://luajit.org/

---

**Need help?** Open an issue on GitHub or check the documentation in the `docs/` directory.
