#!/bin/sh -e

sed 's/cc/tcc/' /mnt/src/sources/BearSSL/conf/Unix.mk > _
mv -f _ /mnt/src/sources/BearSSL/conf/Unix.mk

sed 's/gcc/tcc/' /mnt/src/sources/BearSSL/Makefile > _
mv -f _ /mnt/src/sources/BearSSL/Makefile
