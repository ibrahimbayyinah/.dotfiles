#!/bin/sh

set_transformations() {
    display_transform="$1"
    input_transform="$2"

    # Display transformation command
    hyprctl keyword monitor eDP-1,1920x1080@60.0,0x0,auto,transform,"$display_transform"

    # Touchscreen transformation command
    hyprctl keyword input:touchdevice:transform "$input_transform"

    # Stylus/tablet transformation command
    hyprctl keyword input:tablet:transform "$input_transform"
    
    # Disable keyboard, trackpad and trackpoint
    # hyprctl keyword device:synps/2-synaptics-touchpad:enabled false

    notify-send -t 2000 "Flip" "Flipped"
}

# Function to handle clean exit
clean_exit() {
    pkill -f monitor-sensor
    notify-send -t 2000 "Tablet Mode" "Exiting auto rotation"
    exit
}

# Ensure no duplicate monitor-sensor instances
if pgrep -x "monitor-sensor" > /dev/null; then
    pkill -f monitor-sensor && sleep 1
fi

# Trap signals for graceful exit
trap clean_exit INT TERM

# Notify user that auto rotation has started
notify-send -t 2000 "Tablet Mode" "Started auto rotation"

# Start monitoring sensor data
monitor-sensor | while read -r line; do
    case "$line" in
        *"Accelerometer orientation changed: normal"*)
	    set_transformations 0 0
            ;;
        *"Accelerometer orientation changed: left-up"*)
            set_transformations 1 1
            ;;
        *"Accelerometer orientation changed: bottom-up"*)
            set_transformations 2 2
            ;;
        *"Accelerometer orientation changed: right-up"*)
            set_transformations 3 3
            ;;
    esac
    sleep 0.5
done
