#!/usr/bin/env python3
"""
Rcode Download and Run Script
This script downloads Rcode from GitHub and sets it up for you
"""

import os
import sys
import subprocess
import platform
import zipfile
import tarfile
import urllib.request
import tempfile
import shutil
from pathlib import Path

class RcodeDownloader:
    REPO_URL = "https://github.com/Lemon-Enterprise/Rcode"
    
    def __init__(self):
        self.temp_dir = Path(tempfile.mkdtemp())
        self.install_dir = Path(".") / "rcode"
        
    def download_repository(self):
        """Download the Rcode repository as a zip file"""
        print("Downloading Rcode from GitHub...")
        
        # Download the repository zip
        zip_url = f"{self.REPO_URL}/archive/refs/heads/main.zip"
        zip_path = self.temp_dir / "rcode-main.zip"
        
        try:
            print(f"Downloading from: {zip_url}")
            urllib.request.urlretrieve(zip_url, zip_path)
            print("✓ Download complete!")
            return zip_path
        except Exception as e:
            print(f"✗ Failed to download: {e}")
            return None
    
    def extract_zip(self, zip_path):
        """Extract the zip file"""
        print("Extracting files...")
        
        try:
            with zipfile.ZipFile(zip_path, 'r') as zip_ref:
                # Extract to temp directory first
                extract_dir = self.temp_dir / "extracted"
                zip_ref.extractall(extract_dir)
                
                # Find the extracted directory (should be Rcode-main)
                extracted_dir = extract_dir / "Rcode-main"
                if not extracted_dir.exists():
                    # Try to find it
                    for item in extract_dir.iterdir():
                        if item.is_dir():
                            extracted_dir = item
                            break
                
                if not extracted_dir.exists():
                    print("✗ Could not find extracted directory")
                    return None
                
                print(f"✓ Extracted to: {extracted_dir}")
                return extracted_dir
        except Exception as e:
            print(f"✗ Failed to extract: {e}")
            return None
    
    def setup_rcode(self, extracted_dir):
        """Set up Rcode in the install directory"""
        print("Setting up Rcode...")
        
        try:
            # Create install directory
            self.install_dir.mkdir(parents=True, exist_ok=True)
            
            # Copy all files from extracted directory to install directory
            for item in extracted_dir.iterdir():
                if item.is_dir():
                    shutil.copytree(item, self.install_dir / item.name, dirs_exist_ok=True)
                else:
                    shutil.copy2(item, self.install_dir / item.name)
            
            print(f"✓ Rcode installed to: {self.install_dir}")
            return self.install_dir
        except Exception as e:
            print(f"✗ Failed to setup: {e}")
            return None
    
    def create_launchers(self):
        """Create platform-specific launchers"""
        print("Creating launchers...")
        
        # Windows batch file
        batch_content = """@echo off
setlocal

:: Rcode Launcher for Windows
set SCRIPT_DIR=%~dp0

:: Try LuaJIT first
set LUAJIT=%SCRIPT_DIR%luajit.exe
if not exist "%LUAJIT%" (
    set LUAJIT=luajit
)

%LUAJIT% "%SCRIPT_DIR%src\rcode.lua" %*
"""
        
        with open(self.install_dir / "rcode.bat", "w") as f:
            f.write(batch_content)
        
        # Unix shell script
        shell_content = """#!/bin/bash
# Rcode Launcher for Unix/Linux/macOS

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LUAJIT="${SCRIPT_DIR}/luajit"

if [ ! -f "$LUAJIT" ]; then
    LUAJIT="luajit"
fi

"$LUAJIT" "${SCRIPT_DIR}/src/rcode.lua" "$@"
"""
        
        with open(self.install_dir / "rcode.sh", "w") as f:
            f.write(shell_content)
        os.chmod(self.install_dir / "rcode.sh", 0o755)
        
        # Python launcher
        python_content = """#!/usr/bin/env python3
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
"""
        
        with open(self.install_dir / "rcode.py", "w") as f:
            f.write(python_content)
        os.chmod(self.install_dir / "rcode.py", 0o755)
        
        print("✓ Launchers created!")
    
    def cleanup(self):
        """Clean up temporary files"""
        print("Cleaning up...")
        shutil.rmtree(self.temp_dir, ignore_errors=True)
    
    def run(self):
        """Main download and setup process"""
        print("=" * 60)
        print("Rcode Download and Setup")
        print("=" * 60)
        print()
        
        # Check if already installed
        if (self.install_dir / "src" / "rcode.lua").exists():
            print("Rcode is already installed in the current directory!")
            print()
            print("To run Rcode:")
            if platform.system() == "Windows":
                print("  rcode.bat help")
            else:
                print("  chmod +x rcode.sh && ./rcode.sh help")
                print("  or: python3 rcode.py help")
            return
        
        # Download
        zip_path = self.download_repository()
        if not zip_path:
            return
        
        # Extract
        extracted_dir = self.extract_zip(zip_path)
        if not extracted_dir:
            return
        
        # Setup
        install_dir = self.setup_rcode(extracted_dir)
        if not install_dir:
            return
        
        # Create launchers
        self.create_launchers()
        
        # Cleanup
        self.cleanup()
        
        print()
        print("=" * 60)
        print("✓ Setup Complete!")
        print("=" * 60)
        print()
        print("Rcode has been installed to:", self.install_dir.absolute())
        print()
        print("To run Rcode:")
        if platform.system() == "Windows":
            print("  rcode.bat help")
            print("  rcode.bat edit examples/hello_world.lc")
        else:
            print("  chmod +x rcode.sh")
            print("  ./rcode.sh help")
            print("  ./rcode.sh edit examples/hello_world.lc")
            print("  or: python3 rcode.py help")
        print()
        print("Available commands: help, edit, parse, check, run, manifest, repl, version")
        print()

if __name__ == "__main__":
    downloader = RcodeDownloader()
    downloader.run()
