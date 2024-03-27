#!/bin/sh

# Define the directory where you want to process .zip files
target_directory="."

# Loop through all .zip files in the target directory
for zip_file in "$target_directory"/*.pptm; do
    if [ -e "$zip_file" ]; then
        echo "Processing: $zip_file"
        # Extract only .m4a files from the ppt/media/ directory
        unzip -j "$zip_file" 'ppt/media/*.m4a' -d "$target_directory" && echo "Extraction complete for: $zip_file" && ~/.local/scripts/renzero.sh
    else
        echo "No .zip files found in: $target_directory"
    fi
done
