#!/bin/bash

echo "Prepare to create spl!"
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean
make itop4412_defconfig
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- 

if [ -e u-boot.bin ]
then
	echo "SPL create successfully!"
	exit 0
fi
