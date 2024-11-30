#!/bin/bash -e

cd /mnt/src/packages/linux*/

ln -sf /mnt/bin/gsed ./sed

make PATH="./:$PATH" ARCH="x86" HOSTCC="/mnt/src/gcc-toolchain/bin/gcc -Os -pipe -march=native -g0 -s -static -w" headers -j$(nproc)

find usr/include/ -name \*.h -type f | while read -r file;
do f="${file%/*}"
   f="${f#usr}"
   mkdir -p -v /mnt$f/
   cp -f -v $file /mnt$f/
done

make CC="/mnt/src/gcc-toolchain/bin/gcc -s -static -g0" HOSTCC="/mnt/src/gcc-toolchain/bin/gcc -s -static -g0" ARCH="x86" distclean -j$(nproc)
rm ./sed

cd -
