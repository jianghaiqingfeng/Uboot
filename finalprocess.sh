#!/bin/bash

if [ -e bl2.bin ]
then
	echo "BL2 has exit!"
	rm bl2.bin
else
	echo "BL2 is not exit!"
fi

if [ -e bl2.bin ]
then
	echo "Bl2 still exit!"
	exit 1
else
	echo "BL2 has been deleted!"
fi

if [ -e E4412_N.bl1.bin ]
then
	echo "BL1 is exit!"
else
	echo "BL1 or Uboot is not exit!"
	exit 1
fi

if [ -e u-boot.bin ]
then
	echo "Uboot is exit!"
else
	echo "Uboot is not exit!"
	exit 1
fi

if [ -e mkbl2 ]
then
	cp mkbl2 spl/
	if [ -e spl/u-boot-spl.bin ]
	then
		cd spl
		./mkbl2 u-boot-spl.bin bl2.bin 14336
		cd ../
		cp spl/bl2.bin ./
	fi
else
	echo "mkbl2 is not exit!"
	exit 1
fi

if [ -e bl2.bin ]
then
	echo "BL2 is created successfully!"
else
	echo "BL2 is not created!"
	exit 1
fi

echo "Condition has been prepared!"

dd iflag=dsync oflag=dsync if=E4412_N.bl1.bin of=/dev/sdb seek=1;dd iflag=dsync oflag=dsync if=bl2.bin of=/dev/sdb seek=17;dd iflag=dsync \
oflag=dsync if=u-boot.bin of=/dev/sdb seek=81;sync




