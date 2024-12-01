#!/bin/sh -e

curl -s musl.cc | grep x86_64-linux-musl-native | xargs curl '-#' -fo /mnt/src/packages/x86_64-linux-musl-native.tgz 
mkdir -p /mnt/src/gcc-toolchain/ 
tar -xzf /mnt/src/packages/x86_64-linux-musl-native.tgz -C /mnt/src/gcc-toolchain/ --strip-components=1
