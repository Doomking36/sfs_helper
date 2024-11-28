#!/bin/sh -e

curl -LO https://git.disroot.org/nyght/sfs_sources/src/branch/main/sources.sh
mv sources.sh /mnt/src/ 
cd /mnt/src/
./sources.sh
cd -
