#!/bin/csh

env CONFIG_SHELL="sh" LD="echo" RANLIB="echo" \
  ./configure --prefix=/ --sbindir=/bin \
  --sysconfdir=/etc --enable-libuuid --enable-libblkid \
  --disable-symlink-install --disable-nls --disable-fsck \
  --disable-elf-shlibs --enable-largefile --disable-rpath

sed -e '101,104d;179,181d' ./lib/ext2fs/rbtree.h > _
mv -f _ ./lib/ext2fs/rbtree.h

sed '1 s/ sh/\/bin\/sh/' config.status > _
mv -f _ ./config.status
chmod +x ./config.status

make -j($nproc)
make install -j($nproc)

make distclean
