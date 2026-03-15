#!/bin/sh

# Usage: ./setup_nat.sh <usb_interface>
# Example: ./setup_nat.sh usb0

# Check if an interface name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <usb_interface>"
    exit 1
fi

USB_INTERFACE=$1

# Determine the internet-facing interface
INTERNET_INTERFACE=$(ip route | awk '/default/ {print $5}' | head -n 1)

# Check if an internet interface was detected
if [ -z "$INTERNET_INTERFACE" ]; then
    echo "Error: Could not detect an internet interface."
    exit 1
fi

echo "Setting up NAT for USB interface $USB_INTERFACE via $INTERNET_INTERFACE..."

# Enable IPv4 forwarding
echo "Enabling IPv4 forwarding..."
sysctl -w net.ipv4.ip_forward=1

# Set up IPv4 NAT
echo "Configuring IPv4 NAT..."
iptables -t nat -A POSTROUTING -o "$INTERNET_INTERFACE" -j MASQUERADE
iptables -A FORWARD -i "$INTERNET_INTERFACE" -o "$USB_INTERFACE" -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i "$USB_INTERFACE" -o "$INTERNET_INTERFACE" -j ACCEPT

# Enable IPv6 forwarding
# echo "Enabling IPv6 forwarding..."
# sysctl -w net.ipv6.conf.all.forwarding=1

# Set up IPv6 NAT (optional, if required)
# Uncomment these lines if NAT for IPv6 is needed
# echo "Configuring IPv6 NAT..."
# ip6tables -t nat -A POSTROUTING -o "$INTERNET_INTERFACE" -j MASQUERADE
# ip6tables -A FORWARD -i "$INTERNET_INTERFACE" -o "$USB_INTERFACE" -m state --state RELATED,ESTABLISHED -j ACCEPT
# ip6tables -A FORWARD -i "$USB_INTERFACE" -o "$INTERNET_INTERFACE" -j ACCEPT

echo "NAT setup complete for USB interface $USB_INTERFACE."

exit 0
