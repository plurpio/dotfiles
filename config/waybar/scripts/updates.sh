#! /bin/bash

flatpak update --appstream > /dev/null

pacman='pacman -Qu'
paru='paru -Qu'
flatpak='flatpak list -u'

updates='$pacman\n$paru\n$flatpak'

if [ $updates == "" ]; then
  pendingUpdates=echo $updates | wc -l
  echo "$pendingUpdates 󰏖"
fi
