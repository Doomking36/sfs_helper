#!/bin/sh -e

for file in /mnt/bin/*; do
    if [ -f "$file" ]; then
        file_info=$(file "$file")
        if ! echo "$file_info" | grep -q "statically linked"; then
            echo "$file is not statically linked"
        elif ! echo "$file_info" | grep -q "stripped"; then
            echo "$file is not stripped"
        fi
    fi
done

