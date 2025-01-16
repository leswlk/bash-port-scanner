# Port Scanner

This script scans a range of IP addresses and reports the IP addresses that have a specific port open.

## Usage

./bash_port_scanner.sh <start_ip> <end_ip> <port>

Arguments:

- start_ip: The starting IP address to scan.
- end_ip: The ending IP address to scan.
- port: The port number to check for open ports.

Example:
./bash_port_scanner.sh 192.168.1.1 192.168.1.100 80

This will scan IP addresses from 192.168.1.1 to 192.168.1.100 and report back the IP addresses that have port 80 open.

## Dependencies

- bash
- awk
- nc (netcat)

## Note

This script is a simple example and may not handle all edge cases or complex network configurations. I plan to add more robust error handling, logging, and performance optmization in the future!
