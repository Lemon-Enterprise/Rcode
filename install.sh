#!/bin/bash
# Rcode Installer for Linux/macOS
# Download and install Rcode IDE

set -e

echo "============================================================"
echo "Rcode Installer for Linux/macOS"
echo "============================================================"
echo ""

# Set install path (default: current directory/rcode)
INSTALL_PATH="./rcode"

# Create install directory
mkdir -p "$INSTALL_PATH"
echo "Created directory: $INSTALL_PATH"

# Download Rcode from GitHub
echo "Downloading Rcode from GitHub..."
REPO_URL="https://github.com/Lemon-Enterprise/Rcode/archive/refs/heads/main.zip"
ZIP_PATH="/tmp/rcode-main.zip"

if command -v curl &> /dev/null; then
    curl -L -o "$ZIP_PATH" "$REPO_URL"
elif command -v wget &> /dev/null; then
    wget -O "$ZIP_PATH" "$REPO_URL"
else
    echo "Error: Neither curl nor wget found. Please install one of them."
    exit 1
fi

echo "✓ Download complete!"

# Extract the zip file
echo "Extracting files..."
unzip -q -o "$ZIP_PATH" -d /tmp/
echo "✓ Extraction complete!"

# Find the extracted directory
EXTRACTED_DIR="/tmp/Rcode-main"
if [ ! -d "$EXTRACTED_DIR" ]; then
    EXTRACTED_DIR=$(find /tmp -type d -name "Rcode*" | head -1)
fi

if [ ! -d "$EXTRACTED_DIR" ]; then
    echo "✗ Could not find extracted directory"
    exit 1
fi

# Copy files to install directory
echo "Installing Rcode to $INSTALL_PATH..."
cp -r "$EXTRACTED_DIR"/* "$INSTALL_PATH/"
echo "✓ Installation complete!"

# Create launchers
echo "Creating launchers..."

# Shell script launcher
cat > "$INSTALL_PATH/rcode.sh" << 'EOF'
#!/bin/bash
# Rcode Launcher for Unix/Linux/macOS

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LUAJIT="${SCRIPT_DIR}/luajit"

if [ ! -f "$LUAJIT" ]; then
    LUAJIT="luajit"
fi

"$LUAJIT" "${SCRIPT_DIR}/src/rcode.lua" "$@"
EOF

chmod +x "$INSTALL_PATH/rcode.sh"

# Python launcher
cat > "$INSTALL_PATH/rcode.py" << 'EOF'
#!/usr/bin/env python3
import subprocess
import sys
import os

script_dir = os.path.dirname(os.path.abspath(__file__))
lua_commands = ['luajit', './luajit', './luajit.exe', 'lua5.1', 'lua5.2', 'lua5.3', 'lua5.4']

for cmd in lua_commands:
    lua_path = os.path.join(script_dir, cmd) if cmd.startswith('./') else cmd
    try:
        subprocess.run([lua_path, '--version'], capture_output=True, timeout=5)
        result = subprocess.run(
            [lua_path, os.path.join(script_dir, 'src', 'rcode.lua')] + sys.argv[1:],
            cwd=script_dir
        )
        sys.exit(result.returncode)
    except:
        pass

print("Error: LuaJIT not found. Please install LuaJIT from: https://luajit.org/")
sys.exit(1)
EOF

chmod +x "$INSTALL_PATH/rcode.py"

# Cleanup
echo "Cleaning up..."
rm -f "$ZIP_PATH"
rm -rf "$EXTRACTED_DIR"

echo ""
echo "============================================================"
echo "✓ Setup Complete!"
echo "============================================================"
echo ""
echo "Rcode has been installed to: $(cd "$INSTALL_PATH" && pwd)"
echo ""
echo "To run Rcode:"
echo "  chmod +x rcode.sh"
echo "  ./rcode.sh help"
echo "  ./rcode.sh edit examples/hello_world.lc"
echo "  or: python3 rcode.py help"
echo ""
echo "Available commands: help, edit, parse, check, run, manifest, repl, version"
echo ""
