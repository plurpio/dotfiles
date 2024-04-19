{ config, pkgs, lib, ... }:


{
  #
  # Package manager settings
  #

  # Nix pkg manager configuration
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "freeimage-unstable-2021-11-01" ];

  # Flatpak configuration (with nix-flatpak)
  services.flatpak = {
    enable = true;
    uninstallUnmanagedPackages = true;
    update.auto.enable = true;
    update.auto.onCalendar = "weekly";

    remotes = lib.mkOptionDefault [{
      name = "flathub";
      location = "https://flathub.org/repo/flathub.flatpakrepo";
  }]; };


  #
  # Nix unstable packages
  #
  environment.systemPackages = with pkgs; [
    # Core
    neovim
    kitty
    mako
    chromium

    # Desktop
    hyprpaper
    tofi
    hyprlock
    pywal
    bibata-cursors
    grim
    slurp
    nwg-look

    # Media
    imagemagick
    ffmpeg
    mpv
    spotify

    # Social
    vesktop

    # CLI
    uwufetch # true linux user program
    neofetch # less cool but still linux user program
    wget
    btop
    cmatrix
    bat
    file
    killall
    lf
    unzip
    ripgrep
    zoxide
    yt-dlp
    snapper
    distrobox
    cava
    tlrc
    jq
    playerctl
    brightnessctl
    wl-clipboard

    # Development
    git
    gh
    act
    python3
    go
    python3Packages.virtualenv
    python3Packages.pip
    cargo
    clang
    nodejs

    # Miscellaneous
    cage

    # System
    libnotify
    linuxKernel.packages.linux_6_8.cpupower
    gparted
  ];

  #
  # Flatpaks
  #
  services.flatpak.packages = [
      "org.mozilla.firefox"
      "org.pipewire.Helvum"
      "in.cinny.Cinny"
      "com.valvesoftware.Steam"
      "net.davidotek.pupgui2"
      "org.prismlauncher.PrismLauncher"
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
      "org.signal.Signal"
      "md.obsidian.Obsidian"
      "org.keepassxc.KeePassXC"
      "org.upscayl.Upscayl"
      "com.transmissionbt.Transmission"
    ];
}
