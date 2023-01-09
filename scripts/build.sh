#!/usr/bin/env bash
set -e

echo zig build shell started
ZIG_BOOTSTRAP_PATH="/zig-bootstrap"
ZIG_PATH="/zig"
TARGET="x86_64-linux-gnu"
MCPU="baseline"

echo "preparing zig using zig bootstrap"
cd "${ZIG_BOOTSTRAP_PATH}"
./build "${TARGET}" "${MCPU}"
cd -
echo "[DONE] preparing zig using zig bootstrap"

bash