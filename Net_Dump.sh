#!/bin/bash
# Author: DeAndre Graciano
# Purpose: Network Information Dump Script (Minimal Required Data)
# Date: $(date +%F)

# This script collects basic network information and dumps it to both the screen
# and a text file. The file name automatically includes the date and your name


# Get current date
DATE=$(date +%F)

# Set output file path and name
OUTPUT_FILE="/media/sf_VmShares/${DATE}_DeAndre_Graciano_netdump.txt"

echo "Generating Network Information Dump..."
echo "Saving to: $OUTPUT_FILE"
echo "--------------------------------------"

{
echo "Network Dump - $DATE"
echo "Author: DeAndre Graciano"
echo "Purpose: Linux Networking Information Dump"
echo "---------------------------------------------------"
echo ""
echo "Hostname:"
hostnamectl
echo ""
echo "IP Address Information (enp0s3):"
ip addr show enp0s3
echo ""
echo "Default Route:"
ip route
echo ""
echo "DNS Resolver Config:"
cat /etc/resolv.conf
echo ""
echo "Ping Google (connectivity test):"
ping -c 3 google.com
echo ""
echo "END OF NETWORK DUMP"
echo "---------------------------------------------------"
} | tee "$OUTPUT_FILE"

echo "Network Dump Complete."
echo "File saved as: $OUTPUT_FILE"
echo "Run complete."
