#!/bin/csh

cd /src/sources/pigz/

make -e -j$(nproc)
mv ./pigz /bin/pigz
ln -s pigz /bin/gzip

cd -
