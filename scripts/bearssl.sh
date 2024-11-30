#!/bin/sh -e

sed 's/cc/tcc/' /mnt/src/sources/BearSSL/conf/Unix.mk > _
mv -f _ /mnt/src/sources/BearSSL/conf/Unix.mk
