{ config, pkgs, lib, inputs, ... }:

{
  #
  # Desktop applications and configurations.
  #

  programs.hyprland.enable = true;

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
    # core desktop
    chromium
    hyprpaper
    hyprlock
    kitty
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

    # media
    mpv
    obs-studio
    helvum
    spotify
    yt-dlp
    ffmpeg
    cava
    ani-cli

    # social
    vesktop

    # extra
    gparted
    efibootmgr
  ];


  services.flatpak = {
    enable = true;
    uninstallUnmanagedPackages = true;
    update.auto.enable = true;
    update.auto.onCalendar = "daily";
    remotes = lib.mkOptionDefault [
      { name = "flathub"; location = "https://flathub.org/repo/flathub.flatpakrepo"; }
      { name = "launcher.moe"; location = "https://gol.launcher.moe/gol.launcher.moe.flatpakrepo"; }
    ];

    packages = [
      "com.github.tchx84.Flatseal"
      "org.filezillaproject.Filezilla"
      "com.transmissionbt.Transmission"

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

      { appId = "moe.launcher.an-anime-game-launcher"; origin = "launcher.moe";}
      { appId = "moe.launcher.the-honkers-railway-launcher"; origin = "launcher.moe";}
    ];
  };

  # Enable login manager
  services.greetd.enable = true;
  services.greetd.settings = {
    initial_session = {
      command = "Hyprland";
      user = "nico";
    };
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks --remember-user-session";
      user = "greeter";
    };
  };

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
  # Browsers
  #

  programs.firefox.enable = true;
  programs.firefox.policies = {
    "DisableFirefoxAccounts" = true;
    "DisableFirefoxStudies" = true;
    "DisablePocket" = true;
    "DisableTelemetry" = true;
    "AutofillAddressEnabled" = false;
    "AutofillCreditCardEnabled" = false;
    "DisableFormHistory" = true;
    "HttpsOnlyMode" = "enabled";
    "SearchSuggestEnabled" = true;

    "DefaultDownloadDirectory" = "\${home}/dl";

    "DisableMasterPasswordCreation" = true;
    "OfferToSaveLogins" = false;
    "PasswordManagerEnabled" = false;
    "PrimaryPassword" = false;

    "DisableSetDesktopBackground" = true;
    "DisplayBookmarksToolbar" = "never";
    "DisplayMenuBar" = "default-off";
    "DontCheckDefaultBrowser" = true;
    "NoDefaultBookmarks" = true;
    "OverrideFirstRunPage" = "https://plurp.io";
    "ShowHomeButton" = false;
    "TranslateEnabled" = true;

    "FirefoxHome" = {
      "Search" = true;
      "TopSites" = false;
      "SponsoredTopSites" = false;
      "Highlights" = false;
      "Pocket" = false;
      "SponsoredPocket" = false;
      "Snippets" = false;
      "Locked" = false;
    };

    "Cookies" = {
      "Behavior" = "reject-tracker-and-partition-foreign";
      "BehaviorPrivateBrowsing" = "reject-tracker-and-partition-foreign";
    };

    "DNSOverHTTPS" = {
      "Enabled" =  true;
      "ProviderURL" = "1.1.1.1";
      "Locked" = false;
      "Fallback" = true;
    };

    "EnableTrackingProtection" = {
      "Value" = true;
      "Locked" = false;
      "Cryptomining" = true;
      "Fingerprinting" = true;
    };

    "FirefoxSuggest" = {
      "WebSuggestions" = false;
      "SponsoredSuggestions" = false;
      "ImproveSuggest" = false;
      "Locked" = false;
    };

    "SanitizeOnShutdown" = {
      "Cache" = false;
      "Cookies" = true;
      "Downloads" = true;
      "FormData" = true;
      "History" = true;
      "Sessions" = true;
      "SiteSettings" = false;
      "OfflineApps" = false;
      "Locked" = false;
    };

    "ExtensionSettings" = {
      "uBlock0@raymondhill.net" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      };
      "keepassxc-browser@keepassxc.org" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
      };
      "addon@darkreader.org" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
      };
      "sponsorBlocker@ajay.app" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
      };
      "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
      };
      "extension@tabliss.io" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/tabliss/latest.xpi";
      };
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
      };
      "{c607c8df-14a7-4f28-894f-29e8722976af}" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/temporary-containers/latest.xpi";
      };
      "@testpilot-containers" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
      };
      "{84601290-bec9-494a-b11c-1baa897a9683}" = {
        "installation_mode" = "normal_installed";
        "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ctrl-number-to-switch-tabs/latest.xpi";
      };
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

}
