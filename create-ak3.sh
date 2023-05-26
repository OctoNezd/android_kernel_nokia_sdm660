#!/bin/bash
cp -v output/arch/arm64/boot/Image.gz-dtb AnyKernel3
cd AnyKernel3
zip -r9 kern.zip * -x README.md zipsigner.jar LICENSE
cp kern.zip ..
