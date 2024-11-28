#!/bin/sh -e

cd /mnt/src/packages

# Search through directory to extract and delete .gz, .xz, and .zip 
find . \( -name "*.tar.gz" -o -name "*.tar.xz" -o -name "*.zip" \) -exec sh -c '
  case "$1" in
    *.tar.gz|*.tar.xz) tar xf "$1" ;;
    *.zip) unzip "$1" ;;
  esac && rm "$1"
' sh {} \;

cd -
