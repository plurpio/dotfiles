#! /bin/bash

echo "saving hardware-configuration.nix"
cp /etc/nixos/hardware-configuration.nix /tmp/hardware-configuration.nix
echo "removing old files..."
rm -rf /etc/nixos/*
echo "restoring hardware-configuration.nix"
cp /tmp/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
echo "copying new files..."
for f in *; do cp $PWD/$f /etc/nixos; done
echo "rebuilding system..."
nixos-rebuild switch --flake /etc/nixos#default
echo "copying flake.lock..."
cp /etc/nixos/flake.lock $PWD/flake.lock
