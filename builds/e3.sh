#!/bin/sh -e

cd /mnt/src/packages/e3*/

sed 's/nasm\ -O2/\/mnt\/bin\/nasm\ -O2/' Makefile > _
mv -f _ Makefile
make 64 -j$(nproc)
make -e PREFIX="/mnt/" MANDIR="/mnt/share/man/man1/" install

for i in /mnt/bin/e3*[em,ne,pi,vi,ws]; do ln -sf e3 $i; done

make clean

cd -
