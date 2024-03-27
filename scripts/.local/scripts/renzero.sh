#!/bin/sh

# Loop from 1 to 9
for i in {1..9}; do
    # Create the source and destination file names with leading zeros
    src_file="media${i}.m4a"
    dest_file="media$(printf "%02d" $i).m4a"
    
    # Check if the source file exists
    if [ -e "$src_file" ]; then
        # Rename the file
        mv -i "$src_file" "$dest_file"
        echo "Renamed: $src_file -> $dest_file"
    else
        echo "File not found: $src_file"
    fi
done
