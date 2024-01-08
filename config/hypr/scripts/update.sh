#! /bin/bash

echo "Updating system..."
notify-send "Updating system" "Updating offical (pacman), AUR and flatpak packages"
sudo pacman -Syu --noconfirm
paru -Syu --noconfirm
flatpak update --assumeyes
notify-send "Updates done" "Offical, AUR and flatpak packages have been updated to their latest versions"
read -p "Press enter to close" yayyouupdated
