{ config, pkgs, lib, inputs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  #
  # users
  #

  users.users.nico = {
    isNormalUser = true;
    description = "nico";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker" "libvirtd" "flatpak" "disk"
                  "qemu" "kvm" "sshd" "networkmanager" "audio" "video"];
  };

  home-manager.users.nico = {
    home.username = "nico";
    home.homeDirectory = "/home/nico";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.

    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;
  };

  #
  # system settings
  # 


  # Packages
  services.flatpak.enable = lib.mkOptionDefault false; # disable by default, desktops enable
  nixpkgs.config.allowUnfree = true;
  nix.settings.trusted-users = [ "root" "@wheel" ];
  environment.systemPackages = with pkgs; [
      zoxide tlrc wget unzip killall jq eza bat git file neovim # needed
  
      go cargo clang nodejs gnumake python3 python3Packages.virtualenv
      python3Packages.pip gnupg # dev stuff / neovim depends

      uwufetch fastfetch btop ripgrep # extra
    ];

  # Shell
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  # GPG
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-curses;

  # Documentation
  documentation.man.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "penguin";
  networking.networkmanager.enable = true;

  # Drives
  services.udisks2.enable = true;

  # Power settings
  services.upower.enable = true;
  services.tlp.enable = true;

  # Locale
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LANGUAGE = "en_AU.UTF-8";
    LC_ALL = "en_AU.UTF-8";
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # OpenGL Settings
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];

  # SSH
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.AllowUsers = [ "nico" ];
  programs.ssh.startAgent = true;
  users.users.nico.openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNBlGMXuW0wcZLOtbidBH+Q/XNShld6QEIs2g72jBKxsbopfVP+VSBLAEaIQvExk+osVQSqcRyK0HXY+JOIJcWn04Bb1DwXhP6aYbmY79rwA1uDMCNFwwDdOvF6pqbXwYIRxKE1xPgVi9aLfS+QM14yHVspf5GzqO+Rgn2ePL5XV23w/ljumQ5U13ucg73uhAtkBDJk1+lE8Yj6kRlVQf+gLOaEl+4fY8/9nxd6HefEJaAg88vu4QT9kDL55u2erZo7lMS3mqvVaONG97gogoQJw+n1AnG4PkwaAMcvEKzdp6tUfKgfqXyeXDFxAWkZBBS3X8QphhjyYj+uyQbF50b" ];

  # Automatic Garbage Collection
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 3d";

  # Automatic Updates
  system.autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      dates = "02:00";
      randomizedDelaySec = "45min";
      persistent = true;
    };

  # Kernel options
  boot.kernel.sysctl."vm.swappiness" = 10;
  boot.kernel.sysctl."kernel.sysrq" = 1;

  # Replace sudo with doas
  security.doas.enable = true;
  security.doas.extraConfig = "permit keepenv persist :wheel";
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
}
