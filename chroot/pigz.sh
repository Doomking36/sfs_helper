#!/bin/csh

cd /src/packages/pigz*/

make -e -j2
mv ./pigz /bin/pigz
ln -s pigz /bin/gzip

cd -
