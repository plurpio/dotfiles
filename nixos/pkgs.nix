{ config, pkgs, ... }:

let unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz"; # Enables unstable channel
in
{
  config = {
    nixpkgs.config = { packageOverrides = pkgs: { unstable = import unstableTarball { config = config.nixpkgs.config; }; }; }; # Enables unstable channel

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    environment.systemPackages = with pkgs; [
      # Desktop
      neovim
      kitty
      mako 
      hyprpaper
      unstable.hyprlock
      greetd.tuigreet
      tofi

      # Desktop
      nwg-look
      pywal
      bibata-cursors
    
      # CLI
      neofetch # <<< core system util trust me bro
      tmux
      wget
      btop
      cmatrix
      bat
      killall
      lf
      unzip
      ripgrep
      zoxide
      yt-dlp
      snapper
      kew
      distrobox
    
      # Development
      git
      gh
      python3
      python3Packages.virtualenv
      python3Packages.pip
      cargo
      clang
      nodejs
    
      # Media
      mpv
    
      # Libs
      libnotify
      bluez
      bluez-tools
      brightnessctl
      jq
      wl-clipboard
      grim
      slurp
    ];
    programs.hyprland.enable = true; # Enable Hyprland
    programs.waybar.enable = true; # Enable waybar
    fonts.packages = [ pkgs.nerdfonts pkgs.corefonts pkgs.vistafonts ]; # Install nerd fonts

    services.greetd.enable = true; # Enable greetd
    services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks";

    services.flatpak.enable = true; # Enable flatpak
    };
}
