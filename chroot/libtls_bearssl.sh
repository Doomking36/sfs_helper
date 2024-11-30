#!/bin/csh

cd /src/sources/libtls*/

cut -d ',' -f 1 Makefile > _
 mv -f _ Makefile
 make -j2

env PREFIX=/ make -e install-static
make clean

cd -
