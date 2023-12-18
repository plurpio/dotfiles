#! /bin/bash

sudo pacman -Syu
paru -Syu
flatpak update
echo "Update done"
read tmp
