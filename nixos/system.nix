{ config, pkgs, ... }:

{
  config = {
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Networking
    networking.hostName = "penguin"; # Define your hostname.
    networking.networkmanager.enable = true; # Enable networking
  
    # Automatic Garbage Collection
    nix.gc.automatic = true;
    nix.gc.dates = "weekly";
    nix.gc.options = "--delete-older-than 7d";

    # Automatic Updates
    system.autoUpgrade.enable = true;

    # Reduce swappiness
    boot.kernel.sysctl = { "vm.swappiness" = 10;};
  };
}
