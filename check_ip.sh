#!/bin/bash

# Script to check IP addresses
# Displays both local/private and public IP addresses

echo "=========================================="
echo "        IP Address Information"
echo "=========================================="
echo ""

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Display local/private IP addresses
echo "Local/Private IP Addresses:"
echo "----------------------------"

# Try different methods to get local IP
if command_exists ip; then
    # Linux - using ip command
    ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | while read ip; do
        echo "  - $ip"
    done
elif command_exists ifconfig; then
    # macOS/Linux - using ifconfig
    ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | while read ip; do
        echo "  - $ip"
    done
elif command_exists hostname; then
    # Fallback - using hostname
    hostname -I 2>/dev/null | tr ' ' '\n' | grep -v '^$' | while read ip; do
        echo "  - $ip"
    done
else
    echo "  Unable to determine local IP address"
fi

echo ""

# Display public/external IP address
echo "Public/External IP Address:"
echo "----------------------------"

# Try to get public IP from various services
if command_exists curl; then
    PUBLIC_IP=$(curl -s --max-time 5 https://api.ipify.org 2>/dev/null)
    if [ -n "$PUBLIC_IP" ]; then
        echo "  - $PUBLIC_IP"
    else
        # Try alternative service
        PUBLIC_IP=$(curl -s --max-time 5 https://ifconfig.me 2>/dev/null)
        if [ -n "$PUBLIC_IP" ]; then
            echo "  - $PUBLIC_IP"
        else
            echo "  - Unable to retrieve public IP address"
        fi
    fi
elif command_exists wget; then
    PUBLIC_IP=$(wget -qO- --timeout=5 https://api.ipify.org 2>/dev/null)
    if [ -n "$PUBLIC_IP" ]; then
        echo "  - $PUBLIC_IP"
    else
        echo "  - Unable to retrieve public IP address"
    fi
else
    echo "  - curl or wget required to check public IP"
fi

echo ""
echo "=========================================="
