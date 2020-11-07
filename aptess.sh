#!/bin/bash

# Android Prebuilt Toolchains External Script Set - APTESS
# For build ARM64 and ARM Linux Kernels

clear
echo
echo "-APTESS - Toolchain Choice-"
echo
echo "1) GCC 4.9.0 toolchain from Google"
echo
echo "*) Any other key to Exit"
echo
DIR_KERNEL="$(pwd)"
if [ "${ORIGINAL_PATH}" == "" ]
then
	ORIGINAL_PATH=${PATH}
fi
cd ..
DIR_TOOLCHAIN="$(pwd)/gcc_aarch64-linux-android-4.9"
DIR_TOOLCHAIN32="$(pwd)/gcc_arm-linux-androideabi-4.9"
cd /
cd $DIR_KERNEL
unset errortoolchain
read -p "Choice: " -n 1 -s x
_CROSS_COMPILE=$CROSS_COMPILE
unset CROSS_COMPILE
case "$x" in

 #################### GOOGLE ####################

	1 ) export CROSS_COMPILE="${DIR_TOOLCHAIN}/bin/aarch64-linux-android-";
	    export CROSS_COMPILE_ARM32="${DIR_TOOLCHAIN32}/bin/arm-linux-androideabi-";
        export TARGET_CC="gcc";
        ToolchainName="Google";
        ToolchainCompile="Google GCC 4.9.0";;
	* ) ;;

esac
if [ "$CROSS_COMPILE" == "" ]
then
	CROSS_COMPILE=$_CROSS_COMPILE
	unset _CROSS_COMPILE
else
	echo $ToolchainCompile
fi
