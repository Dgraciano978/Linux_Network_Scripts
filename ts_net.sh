#!/bin/bash
# Author: DeAndre Graciano
# Date: 2025-11-01
# Purpose: Interactive network troubleshooting assistant

echo "Welcome to the Linux Network Troubleshooter!"
echo "Please select your server:"
echo "1) Ubuntu"
echo "2) CentOS"
read -p "Enter 1 or 2: " SERVER

case $SERVER in
  1)
    SERVER_NAME="Ubuntu"
    ;;
  2)
    SERVER_NAME="CentOS"
    ;;
  *)
    echo "Invalid selection. Exiting."
    exit 1
    ;;
esac

echo "You selected $SERVER_NAME."
echo "Select an issue to troubleshoot:"
echo "1) No Internet Connectivity"
echo "2) Set Static IP & DNS"
echo "3) Run a traceroute"
read -p "Enter 1, 2, or 3: " ISSUE

case $ISSUE in
  1)
    echo "Troubleshooting no internet..."
    echo "Check network interfaces:"
    ip addr show
    echo "Check default route:"
    ip route
    echo "Restart networking service:"
    if [ "$SERVER_NAME" == "Ubuntu" ]; then
      echo "sudo systemctl restart NetworkManager"
    else
      echo "sudo systemctl restart network"
    fi
    ;;
  2)
    echo "Setting static IP & DNS instructions:"
    if [ "$SERVER_NAME" == "Ubuntu" ]; then
      echo "Edit /etc/netplan/*.yaml and run 'sudo netplan apply'"
    else
      echo "Edit /etc/sysconfig/network-scripts/ifcfg-eth0 and restart network"
    fi
    ;;
  3)
    read -p "Enter website to trace (e.g., google.com): " WEBSITE
    echo "Running traceroute to $WEBSITE..."
    traceroute $WEBSITE
    ;;
  *)
    echo "Invalid option."
    exit 1
    ;;
esac

echo "Troubleshooting complete."
