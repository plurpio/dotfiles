#! /bin/bash
echo "Updates"
sudo pacman -Syu
paru -Syu
flatpak update
echo ""
echo "Update done"
read done
