#!/bin/csh

cd /src/sources/libtls*/

sed 's/,--version-script=libtls.ver//' Makefile > _
mv -f _ Makefile
make -j2

env PREFIX=/ make -e install-static
make clean

cd -
