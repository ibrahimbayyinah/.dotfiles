#!/bin/sh

# Slightly modified version of chaleq's (Discord) script.

# Function to check if eDP-1 is transformed
is_transformed() {
    # Run wlr-randr command to get the transformation matrix for eDP-1
    # transformation=$(hyprctl monitors all | grep -A10 'eDP-1' | grep 'transform:' | awk '{print $2}')
    local display_name=$1
    transformation=$(hyprctl monitors all | sed -n '/eDP-1/,/transform/{/transform/ {s/\s*transform:\s*//;s/\s*$//;p;q}}')
    echo "TRANSORMATION: $transformation"
    
    # Check if the transformation matrix is not 'normal'
    if [ "$transformation" != "0" ]; then
        return 0  # eDP-1 is transformed
    else
        return 1  # eDP-1 is not transformed
    fi
}

# Transformations function commands for display and input
set_transformations() {
    local display_transform=$1
    local input_transform=$2

    echo $display_transform
    echo $input_transform

    # Display transformation command
    # hyprctl keyword monitor eDP-1,3840x2160@60.0,3840x2160,2,transform,$display_transform
    hyprctl keyword monitor eDP-1,1920x1080@60.0,1920x1080,auto,transform,$display_transform

    # Touchscreen transformation command
    hyprctl keyword input:touchdevice:transform $input_transform

    # Stylus/tablet transformation command
    hyprctl keyword input:tablet:transform $input_transform
    
    # Disable keyboard, trackpad and trackpoint
    # hyprctl keyword device:synps/2-synaptics-touchpad:enabled false

    notify-send -t 2000 "Flip" "Flipped"
}

# is_transformed $1

if is_transformed; then
    # eDP-1 is currently transformed, set transform to normal
    set_transformations 0 0 
else
    # eDP-1 is currently not transformed, set transform to 2 (flip the display and flip the touch screen digitizer).
    set_transformations 2 2 
fi
