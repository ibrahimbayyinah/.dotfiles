#!/bin/sh

for file in *.avif;
do echo "renaming: $file..." && magick "$file" "${file%.avif}.jpg";
done
