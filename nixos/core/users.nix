{ config, pkgs, lib, ... }:

{
  #
  # User settings
  #

  users.users.nico = {
  isNormalUser = true;
  description = "nico";
  extraGroups = ["networkmanager" "wheel" "docker" "libvirtd" "flatpak" "disk"
                 "qemu" "kvm" "sshd" "networkmanager" "audio" "video"];};

  nix.settings.trusted-users = [ "root" "@wheel" ];

  # Fonts
  fonts.fontDir.enable = true;
  fonts.packages = [ pkgs.nerdfonts pkgs.corefonts pkgs.vistafonts
                     pkgs.google-fonts pkgs.noto-fonts pkgs.noto-fonts-emoji];

  # Set your time zone and locale
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


  #
  # Home manager
  #

  home-manager.users.nico = {
    home.username = "nico";
    home.homeDirectory = "/home/nico";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;
  };

}
