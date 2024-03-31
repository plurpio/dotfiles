{ config, pkgs, lib, ... }:

{
  config = {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.permittedInsecurePackages = [ "freeimage-unstable-2021-11-01" ];
    environment.systemPackages = with pkgs; [
      neovim
      spotify
      kitty
      mako 
      hyprpaper
      hyprlock
      greetd.tuigreet
      tofi
      nwg-look
      pywal
      bibata-cursors
      cage
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
      cava
      tlrc
      linuxKernel.packages.linux_6_8.cpupower
      imagemagick
      git
      gh
      act
      python3
      python3Packages.virtualenv
      python3Packages.pip
      cargo
      clang
      nodejs
      mpv
      playerctl
      libnotify
      bluez
      bluez-tools
      brightnessctl
      jq
      wl-clipboard
      grim
      slurp
      gparted
    ];
    programs.hyprland.enable = true; # Enable Hyprland
    programs.waybar.enable = true; # Enable waybar
    fonts.packages = [ pkgs.nerdfonts pkgs.corefonts pkgs.vistafonts pkgs.google-fonts pkgs.noto-fonts pkgs.noto-fonts-extra pkgs.noto-fonts-emoji]; # Update fonts
    fonts.fontDir.enable = true;

    services.greetd.enable = true; # Enable greetd
    services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks";

    services.flatpak = {
      enable = true;
      uninstallUnmanagedPackages = true;
      remotes = lib.mkOptionDefault [{
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }];
      update.auto = {
        enable = true;
        onCalendar = "weekly";
      };

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
        "org.signal.Signal"
        "md.obsidian.Obsidian"
        "org.keepassxc.KeePassXC"
        "org.upscayl.Upscayl"
      ];
    };
    };
}
