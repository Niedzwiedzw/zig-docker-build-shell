#!/usr/bin/env bash
set -e

# shamelessly stolen from https://stackoverflow.com/a/29436423/9014011
function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

echo zig build shell started
ZIG_BOOTSTRAP_PATH="/zig-bootstrap"
ZIG_PATH="/zig"
TARGET="x86_64-linux-gnu"
MCPU="baseline"

echo "preparing zig using zig bootstrap"
cd "${ZIG_BOOTSTRAP_PATH}"
yes_or_no "rebuild bootstrap? (takes ~700 years)" && ./build "${TARGET}" "${MCPU}"
cd -
echo "[DONE] preparing zig using zig bootstrap"

ZIG_PREFIX="${ZIG_BOOTSTRAP_PATH}/out/zig-${TARGET}-${MCPU}"
LLVM_PREFIX="${ZIG_BOOTSTRAP_PATH}/out/${TARGET}-${MCPU}"
ZIG_BIN="${ZIG_PREFIX}/bin/zig"

cd "${ZIG_PATH}";
REBUILD_ALIAS="alias rebuild-zig=\"${ZIG_BIN} build -p stage3 --search-prefix ${LLVM_PREFIX} --zig-lib-dir lib -Dstatic-llvm --verbose\""
echo "adding to bashrc: ${REBUILD_ALIAS}";
echo "${REBUILD_ALIAS}" >> ~/.bashrc


echo "[${ZIG_PATH}] all set up, type 'rebuild-zig' to rebuild"
bash
