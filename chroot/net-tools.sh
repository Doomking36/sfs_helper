#!/bin/csh

cd /src/sources/net-tools

make -e -j2

make -e install DESTDIR="./NETTOOLS"
mv ./NETTOOLS/bin/* /bin/
mv ./NETTOOLS/sbin/* /bin/

rm -r ./NETTOOLS/
make clean

cd -
