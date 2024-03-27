# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix # Include the results of the hardware scan.
    ];

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
    system.autoUpgrade = {
        enable = true;
        flags = [ "--update-input" "nixpkgs" ];
        dates = "02:00";
        randomizedDelaySec = "45min";
      };

    # Reduce swappiness
    boot.kernel.sysctl = { "vm.swappiness" = 10;};
    boot.kernel.sysctl."kernel.sysrq" = 1;

    # Replace sudo with doas
    security.doas.enable = true;
    security.doas.extraConfig = "permit persist :wheel";
    security.sudo.enable = false;


    # Enable nix-command and flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11"; # Did you read the comment?
  };
}
