#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT"
command -v x86_64-w64-mingw32-gcc >/dev/null 2>&1 || { echo 'Install MinGW-w64: sudo apt install mingw-w64'; exit 1; }
cmake --preset windows
cmake --build --preset windows
echo "Windows executable: $ROOT/build/windows/sokol_collision.exe"
