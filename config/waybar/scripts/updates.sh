#! /bin/bash

flatpak update --appstream > /dev/null
checkupdates
paru -Qu
flatpak list -u
