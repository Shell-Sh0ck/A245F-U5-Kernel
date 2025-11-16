#!/bin/bash

cd kernel-5.10
python2 scripts/gen_build_config.py --kernel-defconfig a24_00_defconfig --kernel-defconfig-overlays entry_level.config -m user -o ../out/target/product/a24/obj/KERNEL_OBJ/build.config

export ARCH=arm64
export PLATFORM_VERSION=13
export CROSS_COMPILE="aarch64-linux-gnu-"
export CROSS_COMPILE_COMPAT="arm-linux-gnueabi-"
export OUT_DIR="../out/target/product/a24/obj/KERNEL_OBJ"
export DIST_DIR="../out/target/product/a24/obj/KERNEL_OBJ"
export BUILD_CONFIG="../out/target/product/a24/obj/KERNEL_OBJ/build.config"

export TRIM_NONLISTED_KMI=0 # Allows you to export all unused symbols.
export KMI_SYMBOL_LIST_STRICT_MODE=0 # If set to 1, executes strict character verification.
export DO_NOT_STRIP_MODULES=0 # If set to 1, saves debugging information in the assembled modules.

cd ../kernel
./build/build.sh
