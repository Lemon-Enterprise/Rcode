<#
Rcode Installer for Windows (PowerShell)
Download and install Rcode IDE
#>

param(
    [string]$InstallPath = ".\rcode"
)

Write-Host "=" -ForegroundColor Cyan
Write-Host "Rcode Installer for Windows" -ForegroundColor Cyan
Write-Host "=" -ForegroundColor Cyan
Write-Host ""

# Create install directory
if (-not (Test-Path $InstallPath)) {
    New-Item -ItemType Directory -Path $InstallPath | Out-Null
    Write-Host "Created directory: $InstallPath" -ForegroundColor Green
}

# Download Rcode from GitHub
$repoUrl = "https://github.com/Lemon-Enterprise/Rcode/archive/refs/heads/main.zip"
$zipPath = "$env:TEMP\rcode-main.zip"

Write-Host "Downloading Rcode from GitHub..." -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri $repoUrl -OutFile $zipPath
    Write-Host "✓ Download complete!" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to download: $_" -ForegroundColor Red
    exit 1
}

# Extract the zip file
Write-Host "Extracting files..." -ForegroundColor Yellow
try {
    Expand-Archive -Path $zipPath -DestinationPath $env:TEMP -Force
    Write-Host "✓ Extraction complete!" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to extract: $_" -ForegroundColor Red
    exit 1
}

# Find the extracted directory
$extractedDir = Join-Path $env:TEMP "Rcode-main"
if (-not (Test-Path $extractedDir)) {
    $extractedDir = Get-ChildItem $env:TEMP | Where-Object { $_.PSIsContainer -and $_.Name -like "Rcode*" } | Select-Object -First 1 | ForEach-Object { $_.FullName }
}

if (-not $extractedDir) {
    Write-Host "✗ Could not find extracted directory" -ForegroundColor Red
    exit 1
}

# Copy files to install directory
Write-Host "Installing Rcode to $InstallPath..." -ForegroundColor Yellow
try {
    Copy-Item -Path "$extractedDir\*" -Destination $InstallPath -Recurse -Force
    Write-Host "✓ Installation complete!" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to install: $_" -ForegroundColor Red
    exit 1
}

# Create launchers
Write-Host "Creating launchers..." -ForegroundColor Yellow

# Windows batch file
$batchContent = @"
@echo off
setlocal

:: Rcode Launcher for Windows
set SCRIPT_DIR=%~dp0

:: Try LuaJIT first
set LUAJIT=%SCRIPT_DIR%luajit.exe
if not exist "%LUAJIT%" (
    set LUAJIT=luajit
)

%LUAJIT% "%SCRIPT_DIR%src\rcode.lua" %*
"@

$batchContent | Out-File -FilePath "$InstallPath\rcode.bat" -Encoding ASCII

# Python launcher
$pythonContent = @"
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
"@

$pythonContent | Out-File -FilePath "$InstallPath\rcode.py" -Encoding ASCII

# Cleanup
Write-Host "Cleaning up..." -ForegroundColor Yellow
Remove-Item $zipPath -ErrorAction SilentlyContinue
Remove-Item $extractedDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "" -ForegroundColor Cyan
Write-Host "=" -ForegroundColor Cyan
Write-Host "✓ Setup Complete!" -ForegroundColor Cyan
Write-Host "=" -ForegroundColor Cyan
Write-Host ""
Write-Host "Rcode has been installed to: $InstallPath" -ForegroundColor Green
Write-Host ""
Write-Host "To run Rcode:" -ForegroundColor Yellow
Write-Host "  rcode.bat help" -ForegroundColor Green
Write-Host "  rcode.bat edit examples\hello_world.lc" -ForegroundColor Green
Write-Host ""
Write-Host "Available commands: help, edit, parse, check, run, manifest, repl, version" -ForegroundColor Yellow
Write-Host ""
