#!/bin/bash
# ==========================================
# CentOS 9 Server Security Setup Script
# Without auditd to avoid errors
# ==========================================

# Exit if any command fails
set -e

# Update packages
echo "Updating system packages..."
dnf -y update

# Install and enable firewalld
echo "Installing firewalld..."
dnf -y install firewalld
systemctl enable firewalld --now

# Configure firewall rules
echo "Configuring firewall rules..."
firewall-cmd --permanent --add-service=ssh
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload

# Secure SSH configuration
echo "Securing SSH..."
SSH_CONFIG="/etc/ssh/sshd_config"
cp $SSH_CONFIG "${SSH_CONFIG}.bak"
sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' $SSH_CONFIG
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG
systemctl reload sshd

# Enable automatic updates
echo "Enabling automatic updates..."
dnf -y install dnf-automatic
systemctl enable --now dnf-automatic.timer

echo "Security hardening complete!"
