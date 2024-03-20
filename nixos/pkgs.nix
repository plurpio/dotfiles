{ config, pkgs, lib, ... }:

#let unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz"; # Enables unstable channel
#in
{
  config = {
#    nixpkgs.config = { packageOverrides = pkgs: { unstable = import unstableTarball { config = config.nixpkgs.config; }; }; }; # Enables unstable channel

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
#    nixpkgs.config.permittedInsecurePackages = [ "freeimage-unstable-2021-11-01" ];
    environment.systemPackages = with pkgs; [
      # Core
      neovim
      kitty
      mako 
      hyprpaper
#      unstable.hyprlock
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
      tlrc
    
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

      # System
      gparted
    ];
    programs.hyprland.enable = true; # Enable Hyprland
    programs.waybar.enable = true; # Enable waybar
    fonts.packages = [ pkgs.nerdfonts pkgs.corefonts pkgs.vistafonts ]; # Install nerd fonts

    services.greetd.enable = true; # Enable greetd
    services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks";

    services.flatpak = {
      enable = true;
      uninstallUnmanagedPackages = true;
      remotes = lib.mkOptionDefault [{
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }];

      packages = [
        "org.mozilla.firefox"
        "org.flameshot.Flameshot"
        "org.pipewire.Helvum"
        "dev.vencord.Vesktop"
        "in.cinny.Cinny"
        "com.valvesoftware.Steam"
        "net.davidotek.pupgui2"
        "org.prismlauncher.PrismLauncher"
        "net.brinkervii.grapejuice"
        "com.heroicgameslauncher.hgl"
        "io.itch.itch"
        "com.obsproject.Studio"
        "org.gimp.GIMP"
        "org.audacityteam.Audacity"
        "org.kde.kdenlive"
        "org.pipewire.Helvum"
        "sh.cider.Cider"
        "com.github.tchx84.Flatseal"
        "org.filezillaproject.Filezilla"
        "com.spotify.Client"
        "org.signal.Signal"
      ];
    };
    };
}
