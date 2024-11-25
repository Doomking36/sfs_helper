#!/bin/csh

make -e -j($nproc)
mv ./pigz /bin/pigz
ln -s pigz /bin/gzip
