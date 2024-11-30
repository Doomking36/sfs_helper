#!/bin/sh -e

cd /src/sources/libtls*/

cut -f1 -d ",--version" Makefile > _
 mv -f _ Makefile
 make -j2

env PREFIX=/ make -e install-static
make clean

cd -
