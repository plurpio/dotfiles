#! /bin/bash

flatpak update --appstream > /dev/null

pacman='$(checkupdates)'
paru='$(paru -Qu)'
flatpak='$(flatpak list -u)'

updates='$pacman\n$paru\n$flatpak'

if [ $updates == "" ]; then
  echo "󰏖"
fi
