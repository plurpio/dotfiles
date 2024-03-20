#! /bin/bash

echo "saving hardware-configuration.nix"
sudo cp /etc/nixos/hardware-configuration.nix /tmp/hardware-configuration.nix
echo "removing old files..."
sudo rm -rf /etc/nixos/*
echo "restoring hardware-configuration.nix"
sudo cp /tmp/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
echo "copying new files..."
for f in *; do sudo cp $PWD/$f /etc/nixos; done
echo "rebuilding system..."
sudo nixos-rebuild switch --flake /etc/nixos#default
echo "copying flake.lock..."
sudo cp /etc/nixos/flake.lock $PWD/flake.lock
