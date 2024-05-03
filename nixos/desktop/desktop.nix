{ config, pkgs, lib, inputs, ... }:

{
  #
  # Desktop applications and configurations.
  #

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;

  programs.waybar.enable = true;
  programs.kdeconnect.enable = true;
  services.onedrive.enable = true;

  # Desktop Portals and Polkit
  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  security.polkit.enable = true;

  # Fonts
  fonts.fontDir.enable = true;
  fonts.packages = [ pkgs.nerdfonts pkgs.corefonts pkgs.vistafonts
                     pkgs.google-fonts pkgs.noto-fonts pkgs.noto-fonts-emoji];

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
    keepassxc
    imagemagick

    # extra
    gparted
    efibootmgr

    vlc
    obs-studio
    helvum
    spotify

  ];

  services.flatpak.packages = [ 
    "com.github.tchx84.Flatseal"
    "org.filezillaproject.Filezilla"
    "com.transmissionbt.Transmission"

    "org.mozilla.firefox" 

    "org.kde.kdenlive"
    "org.kde.krita"
    "org.audacityteam.Audacity"
    "org.upscayl.Upscayl"
    "org.gimp.GIMP"

    "md.obsidian.Obsidian"

    "com.valvesoftware.Steam"
    "net.davidotek.pupgui2"
    "org.prismlauncher.PrismLauncher"
    "com.heroicgameslauncher.hgl"
    "io.itch.itch"
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
      style.name = "gtk";
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
    "cbghhgpcnddeihccjmnadmkaejncjndb" # vencord
    "oboonakemofpalcgghocfoadofidjkkk" # keepass
    "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
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
  # Progressive Web Apps ( PWAs )
  #


  home-manager.users.nico.xdg.desktopEntries =  {
    discord = {
      name = "Discord";
      genericName = "Discord";
      exec = "chromium --app=https://discord.com/app";
      terminal = false;
      categories = [ "Network" "X-Social" ];
      mimeType = [ "text/html" "text/xml" ];
    };

    whatsapp = {
      name = "Whatsapp";
      genericName = "Messages";
      exec = "chromium --app=https://web.whatsapp.com/";
      terminal = false;
      categories = [ "Network" "X-Social" ];
      mimeType = [ "text/html" "text/xml" ];
    };

    onedrive = {
      name = "Onedrive";
      genericName = "Storage";
      exec = "chromium --app=https://onedrive.live.com";
      terminal = false;
      categories = [ "Network" "X-Storage" ];
      mimeType = [ "text/html" "text/xml" ];
    };

    gmessages = {
      name = "Google Messages";
      genericName = "Phone Messages";
      exec = "chromium --app=https://messages.google.com";
      terminal = false;
      categories = [ "Network" "X-Messages" ];
      mimeType = [ "text/html" "text/xml" ];
    };
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
  # Enable weylus ( use ipad as drawing tablet )
  #

  programs.weylus = {
    enable = true;
    users = [ "nico" ];
    openFirewall = true;
  };

  users.users.nico.extraGroups = [ "uinput" ];

  #
  # Enable pipewire/audio
  #

  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.wireplumber.enable = true;

}
