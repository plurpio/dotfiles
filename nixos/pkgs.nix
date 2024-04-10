{ config, pkgs, lib, ... }:

{
  config = {
    nixpkgs.config.permittedInsecurePackages = [ "freeimage-unstable-2021-11-01" ];

    environment.systemPackages = with pkgs; [
      neovim
      kitty
      mako
      hyprpaper
      hyprlock
      file
      intel-media-driver
      greetd.tuigreet
      tofi
      nwg-look
      spotify
      pywal
      bibata-cursors
      cage
      uwufetch # true linux user program
      neofetch # less cool but still linux user program
      tmux
      wget
      btop
      cmatrix
      bat
      killall
      lf
      unzip
      ripgrep
      grim
      slurp
      go
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
      ffmpeg
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
      gparted
    ];

    services.flatpak.packages = [
        "org.mozilla.firefox"
        "org.pipewire.Helvum"
        "dev.vencord.Vesktop"
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
      ];
    };
}
