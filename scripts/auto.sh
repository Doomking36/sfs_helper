#!/bin/sh -e

./pre_packages.sh
./create_dir.sh
./mknod.sh
./fstab.sh
./passwd.sh
./groups.sh
./utmp.sh
./cacerts.sh
./profile.sh
./toolchain.sh
./src.sh
