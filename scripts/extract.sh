#!/bin/bash -e

cd /mnt/src/packages

# Search through directory to extract and delete .gz, .xz, .zip, and .tgz
find . \( -name "*.tar.gz" -o -name "*.tar.xz" -o -name "*.zip" -o -name "*.tgz" \) -exec sh -c '
  case "$1" in
    *.tar.gz|*.tar.xz|*.tgz) tar xf "$1" ;;
    *.zip) unzip "$1" ;;
  esac && rm "$1"
' sh {} \;

cd -
