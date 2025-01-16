#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <start_ip> <end_ip> <port>"
    exit 1
fi

# Assign arguments to variables
start_ip=$1
end_ip=$2
port=$3

# Convert IP addresses to integers
start_ip_int=$(echo $start_ip | awk -F '.' '{print ($1 * 256 * 256 * 256) + ($2 * 256 * 256) + ($3 * 256) + $4}')
end_ip_int=$(echo $end_ip | awk -F '.' '{print ($1 * 256 * 256 * 256) + ($2 * 256 * 256) + ($3 * 256) + $4}')

# Check if start IP is less than or equal to end IP
if [ $start_ip_int -gt $end_ip_int ]; then
    echo "Start IP must be less than or equal to end IP"
    exit 1
fi

# Scan IP addresses and ports
for ((i=$start_ip_int; i<=$end_ip_int; i++)); do
    # Convert integer to IP address
    ip=$(printf "%d.%d.%d.%d" $((i>>24)) $(((i>>16)&255)) $(((i>>8)&255)) $((i&255)))
    
    # Check if port is open
    nc -zv -w1 $ip $port 2>/dev/null
    if [ $? -eq 0 ]; then
        echo $ip
    fi
done
