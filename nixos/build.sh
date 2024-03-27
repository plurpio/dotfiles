#! /bin/bash

echo "saving hardware-configuration.nix"
doas cp /etc/nixos/hardware-configuration.nix /tmp/hardware-configuration.nix
echo "removing old files..."
doas rm -rf /etc/nixos/*
echo "restoring hardware-configuration.nix"
doas cp /tmp/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
echo "copying new files..."
for f in *; do doas cp $PWD/$f /etc/nixos; done
echo "rebuilding system..."
doas nixos-rebuild switch --flake /etc/nixos#default
echo "copying flake.lock..."
doas cp /etc/nixos/flake.lock $PWD/flake.lock
