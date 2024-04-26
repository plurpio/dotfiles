{ config, pkgs, lib, inputs, ... }:

{
  #
  # Desktop applications and configurations.
  #

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;

  programs.waybar.enable = true;
  programs.kdeconnect.enable = true;

  # Enables desktop portals and polkit
  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  security.polkit.enable = true;

  # Core Desktop Applications
  environment.systemPackages = with pkgs; [
    chromium # not installed with programs.chromium.enable
    hyprpaper
    hyprlock
    mako
    tofi
    pywal
    grim
    slurp
    brightnessctl
    wl-clipboard
    playerctl
    libnotify
    cava
    keepassxc
    imagemagick
  ];

  services.flatpak.packages = [ 
    "com.github.tchx84.Flatseal"
    "org.mozilla.firefox" 
  ];

  # Enable login manager
  services.greetd.enable = true;
  services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks";

  #
  # GTK/QT Theming
  #

  home-manager.users.nico =  {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    gtk = {
      enable = true;
      theme = { name = "Tokyonight-Dark-B"; package = pkgs.tokyo-night-gtk; };
      iconTheme = { name = "Papirus"; package = pkgs.papirus-icon-theme; };
    };

    qt = {
      enable = true;
      style.name = "Tokyonight-Dark-B";
      platformTheme.name = "gtk";
    };
  };


  #
  # Terminal
  #

  home-manager.users.nico.programs.kitty = {
    enable = true;
    font.name = "ComicShannsMono Nerd Font";
    font.size = 20;
    settings = {
      include = "/home/nico/.cache/wal/colors-kitty.conf";
      window_padding_width = 2;
      scrollback_lines = 10000;
      cursor_shape = "beam";
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };

  #
  # Browsers
  #

  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
    "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    "gebbhagfogifgggkldgodflihgfeippi" # return youtube dislike
    "hipekcciheckooncpjeljhnekcoolahp" # tabliss
    "cbghhgpcnddeihccjmnadmkaejncjndb" # vesktop
    "oboonakemofpalcgghocfoadofidjkkk" # keepass
  ];

  programs.chromium.extraOpts = {
    "OsColorMode" = "dark";
    "BrowserSignin" = 0;
    "PasswordManagerEnabled" = false;
    "ShowAppsShortcutInBookmarkBar" = false;
    "SyncDisabled" = true;
    "DeviceMetricsReportingEnabled" = false;
    "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
    "DefaultSearchProviderName" = "DuckDuckGo";
    "SavingBrowserHistoryDisabled" = true;
  };

  #
  # Virtualisation
  #

  programs.virt-manager.enable = true;

  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd.enable = true;
    libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
    libvirtd.qemu.swtpm.enable = true;
  };

  #
  # Enable pipewire/audio
  #

  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.wireplumber.enable = true;

}
