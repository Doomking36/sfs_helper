#!/bin/csh

cut -f1 -d ",--version" Makefile > _
 mv -f _ Makefile
 make -j($nproc)

env PREFIX=/ make -e install-static
make clean