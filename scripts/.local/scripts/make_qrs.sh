#!/bin/sh

# Usage: ./make_qrs.sh input.csv

inputfile=$1

# Skip header
tail -n +1 "$inputfile" | while IFS=, read -r name link
do
    # Strip leading/trailing spaces (POSIX way)
    name=$(echo "$name" | awk '{$1=$1;print}')

    # Make sure link is not empty
    if [ -n "$link" ]; then
        # Use quotes so spaces/dots in name work
        printf %s "$link" | qrencode -s 10 -d 200 -o "${name}.png"
        echo "Created QR: ${name}.png"
    fi
done
