#!/bin/bash

# Switch firewalld default profile to drop
sudo firewall-cmd --set-default-zone=drop

# System update
sudo dnf upgrade -y --refresh

# Install essential packages and reboot
printf "\n\n\n#---------- Installing Essential Packages ----------#\n\n\n"

garbage="libreoffice-* rhythmbox gnome-contacts gnome-photos gnome-maps gnome-weather gnome-tour cheese"
essentialPackages="vim git exa btop speedtest-cli virt-manager seahorse firewall-config gnome-tweaks"

sudo dnf remove -y $garbage
sudo dnf install -y $essentialPackages

printf "\n\n\n#---------- System Reboot ----------#\n\n\n"
sleep 3
reboot
