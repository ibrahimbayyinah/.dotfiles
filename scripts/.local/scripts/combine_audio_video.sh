#!/bin/sh

# Directory containing the video files
INPUT_DIR="."

# Loop through all "*-slides.mp4" files in the directory
for slide_file in "$INPUT_DIR"/*-slides.mp4; do
    # Extract the base name without the "-slides" suffix
    base_name=$(basename "$slide_file" "-slides.mp4")
    
    # Construct the corresponding video file name
    audio_file="$INPUT_DIR/$base_name.mp4"

    # Check if the video file exists
    if [ -f "$audio_file" ]; then
        # Construct the output file name
        output_file="$INPUT_DIR/${base_name}_combined.mp4"
        
        echo "Combining audio from '$audio_file' with video from '$slide_file' into '$output_file'..."
        
        # Use ffmpeg to combine the audio and video
        ffmpeg -i "$slide_file" -i "$audio_file" -map 0:v:0 -map 1:a:0 -c:v copy -c:a copy "$output_file"
    else
        echo "Warning: Video file '$slide_file' not found for '$audio_file'. Skipping..."
    fi
done

echo "Processing complete."
