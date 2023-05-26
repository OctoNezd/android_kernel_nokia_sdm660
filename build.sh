#!/bin/bash
set -e
export PATH="$HOME/proton-clang/bin:$HOME/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9/bin:$PATH"
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
export KERNEL_IMG=output/arch/arm64/boot/Image.gz-dtb
export USE_HOST_LEX=yes
export KBUILD_BUILD_USER=octo
export KBUILD_BUILD_HOST=ares
export CCACHE_DIR=$(pwd)/.ccache
export USE_CCACHE=1
export CCACHE_EXEC=$( command -v ccache )
whereis ld
echo Making defconfig
make CC='ccache clang' nokia_defconfig O=output/
echo Making kernel
make -j$(nproc --all) CC='ccache clang' O=output/
