#!/bin/csh

sed -e 's/=ar/=\"tcc -ar\"/' -e 's/=cc/=\"tcc -s -static -g0\"/'  \
     -e 's/LOCALE=/LOCALE=us/' -e 's/LDFLAGS=/LDFLAGS=\"\$LDFLAGS\"/' \
     -e 's/\/usr\/local//' -e 's/more/less/' -e 's/\/usr//' \
     -e 's/\/sbin/\/bin/' configure > _

 mv -f _ configure
 chmod +x configure

./configure

make -j($nproc)
make MANDIR=/share/man/ install
make distclean
