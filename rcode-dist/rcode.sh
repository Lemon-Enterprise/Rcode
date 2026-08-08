#!/bin/bash
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
