#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT"
cmake --preset linux
cmake --build --preset linux
"$ROOT/build/linux/sokol_collision"
