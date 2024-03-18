#! /bin/bash

for f in *; do sudo ln -fs $PWD/$f /etc/nixos; done
sudo nixos-rebuild switch
