#!/bin/sh

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >&2
    exit 1
fi

# Check for required arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <SSID>" >&2
    exit 1
fi

pkill wpa

SSID="$1"

# Convert SSID to lowercase and remove spaces
CONFIG_SSID=$(echo "$SSID" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
TIMESTAMP=$(date +%Y%m%d%H%M%S)
CONFIG_FILE="/etc/wpa_supplicant/wpa_supplicant_${CONFIG_SSID}_${TIMESTAMP}.conf"
INTERFACE="wlan0"  # Change if your Wi-Fi interface is different

# Prompt user for password securely
echo "Enter password for SSID $SSID: "
stty -echo
read PASSWORD
stty echo
echo ""

# Generate the WPA supplicant configuration
echo "Generating WPA supplicant configuration..."
wpa_passphrase "$SSID" "$PASSWORD" > "$CONFIG_FILE"
# echo "network={\n    ssid=\"$SSID\"\n    psk=\"$PASSWORD\"\n}" > "$CONFIG_FILE"
chmod 600 "$CONFIG_FILE"

# Restart wpa_supplicant
# killall wpa_supplicant;
wpa_supplicant -B -i "$INTERFACE" -c "$CONFIG_FILE"

# Obtain an IP address via DHCP
# dhclient "$INTERFACE"

echo "Connected to $SSID using config file $CONFIG_FILE"
