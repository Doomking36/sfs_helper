#!/bin/bash -e

cd /mnt/src/sources/net-tools/

env CC="/mnt/src/gcc-toolchain/bin/gcc -L/mnt/lib -I/mnt/include -w" \
    LDFLAGS="-s -static -g0" CFLAGS="-Os -pipe -march=native" \
    AR="/mnt/src/gcc-toolchain/bin/ar" RANLIB="/mnt/src/gcc-toolchain/bin/ranlib" \
    make -j2 #configure what you need

env CC="/mnt/src/gcc-toolchain/bin/gcc -L/mnt/lib -I/mnt/include -w" \
    LDFLAGS="-s -static -g0" CFLAGS="-Os -pipe -march=native" \
    AR="/mnt/src/gcc-toolchain/bin/ar" RANLIB="/mnt/src/gcc-toolchain/bin/ranlib" \
    make -j2

cd /mnt/src;
chroot /mnt /bin/csh #comming back to the action!!
source /etc/profile
cd /src/sources/net-tools

make -e -j2

make -e install DESTDIR="./NETTOOLS"
mv ./NETTOOLS/bin/* /bin/
mv ./NETTOOLS/sbin/* /bin/

rm -r ./NETTOOLS/
make clean

cd -
