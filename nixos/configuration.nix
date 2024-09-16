{ config, pkgs, lib, inputs, ... }:

{

  imports = [ /etc/nixos/hardware-configuration.nix ];

  #
  # Desktop
  #

  # Core desktop programs
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  programs.waybar.enable = true;
  
  xdg.portal.enable = true;
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
    swww
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
    qpwgraph
    yt-dlp
    ffmpeg
    cava
    ani-cli
    spicetify-cli

    # social
    vesktop

    # cli
    zoxide
    tlrc
    wget
    unzip
    killall
    jq
    eza
    bat
    git
    file
    neovim
    tmux
    trash-cli
    stow
    btop
    ripgrep
    distrobox

    # dev
    go
    cargo
    clang
    nodejs
    gnumake
    python3
    python3Packages.virtualenv
    python3Packages.pip
    gnupg

    # extra
    gparted
    efibootmgr
    uwufetch
    fastfetch
    scrcpy
    cage
    r2modman
  ];

  services.flatpak = {
    enable = true;
    uninstallUnmanagedPackages = false;
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
      "org.audacityteam.Audacity"
      "org.upscayl.Upscayl"
      "org.kde.krita"
      "org.gimp.GIMP"
      "com.orama_interactive.Pixelorama"

      "com.spotify.Client"
      "com.github.wwmm.easyeffects"

      "md.obsidian.Obsidian"
      "net.ankiweb.Anki"
      "io.gitlab.news_flash.NewsFlash"
      "com.jeffser.Alpaca"
      "org.localsend.localsend_app"

      "org.mozilla.Thunderbird"

      "com.valvesoftware.Steam"
      "io.github.everestapi.Olympus"
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

  # Android Debug Bridge
  programs.adb.enable = true;

  # Virtualisation
  programs.virt-manager.enable = true;
  virtualisation = {
    waydroid.enable = true;
    docker.enable = true;
    spiceUSBRedirection.enable = true;
    libvirtd.enable = true;
    libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
    libvirtd.qemu.swtpm.enable = true;
    vmware.host.enable = true;
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
    "SearchSuggestEnabled" = false;

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
      "Cookies" = false;
      "Downloads" = true;
      "FormData" = false;
      "History" = true;
      "Sessions" = false;
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
  # system settings
  # 

  # users
  users.users.nico = {
    isNormalUser = true;
    description = "nico";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker" "libvirtd" "flatpak" "disk"
                  "qemu" "kvm" "sshd" "networkmanager" "audio" "video" "docker"];
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.trusted-users = [ "root" "@wheel" ];

  # Shell
  programs.zsh.enable = true;

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

  # Printing
  services.printing.enable = true;
  services.ipp-usb.enable = true;

  # Drives
  services.udisks2.enable = true;
  services.onedrive.enable = true;

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

  # Enable dynamically linked executables
  programs.nix-ld.enable = true;

  # OpenGL Settings
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];

  # Enable audio
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.wireplumber.enable = true;

  # SSH
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.AllowUsers = [ "nico" ];
  programs.ssh.startAgent = true;
  users.users.nico.openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNBlGMXuW0wcZLOtbidBH+Q/XNShld6QEIs2g72jBKxsbopfVP+VSBLAEaIQvExk+osVQSqcRyK0HXY+JOIJcWn04Bb1DwXhP6aYbmY79rwA1uDMCNFwwDdOvF6pqbXwYIRxKE1xPgVi9aLfS+QM14yHVspf5GzqO+Rgn2ePL5XV23w/ljumQ5U13ucg73uhAtkBDJk1+lE8Yj6kRlVQf+gLOaEl+4fY8/9nxd6HefEJaAg88vu4QT9kDL55u2erZo7lMS3mqvVaONG97gogoQJw+n1AnG4PkwaAMcvEKzdp6tUfKgfqXyeXDFxAWkZBBS3X8QphhjyYj+uyQbF50b" ];

  # Enable fwupd ( firmware updater )
  services.fwupd.enable = true;

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
  security.doas.extraConfig = ''
    permit keepenv persist :wheel
    permit nopass :wheel as root cmd /run/current-system/sw/bin/kubectl
 ''; 
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
