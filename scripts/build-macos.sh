#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT"
[[ "$(uname -s)" == "Darwin" ]] || { echo 'Run the native macOS build on a Mac.'; exit 1; }
cmake --preset macos
cmake --build --preset macos
echo "macOS executable: $ROOT/build/macos/sokol_collision"
