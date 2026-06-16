#!/usr/bin/env bash

PLAYLIST_URL="$1"

yt-dlp --flat-playlist --print "%(playlist_index)03d %(id)s" "$PLAYLIST_URL" |
while read -r index id; do
    for file in *"$id"*; do
        [ -e "$file" ] || continue

        if [[ "$file" != "$index - "* ]]; then
            mv -n -- "$file" "$index - $file"
            echo "Renamed: $file -> $index - $file"
        fi
    done
done
