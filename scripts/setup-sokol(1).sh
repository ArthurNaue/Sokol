#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
git clone --depth 1 https://github.com/floooh/sokol.git "$TMP/sokol"
mkdir -p "$ROOT/sokol"
cp "$TMP/sokol/sokol_app.h" "$ROOT/sokol/"
cp "$TMP/sokol/sokol_gfx.h" "$ROOT/sokol/"
cp "$TMP/sokol/sokol_glue.h" "$ROOT/sokol/"
cp "$TMP/sokol/sokol_log.h" "$ROOT/sokol/"
cp "$TMP/sokol/util/sokol_gl.h" "$ROOT/sokol/"
echo "Sokol headers installed in $ROOT/sokol"
