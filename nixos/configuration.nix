# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz"; # Enables unstable channel
in
{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  config = {
    nixpkgs.config = { packageOverrides = pkgs: { unstable = import unstableTarball { config = config.nixpkgs.config; }; }; }; # Enables unstable channel
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.permittedInsecurePackages = [ "freeimage-unstable-2021-11-01" ];

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  
    # Networking
    networking.hostName = "penguin"; # Define your hostname.
#    networking.wireless.enable = true;  # Enables wireless support
    networking.networkmanager.enable = true; # Enable networking
  
    # Set your time zone.
    time.timeZone = "Australia/Sydney";
    
    # Select internationalisation properties.
    i18n.defaultLocale = "en_AU.UTF-8";
    
    i18n.extraLocaleSettings = {
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
    
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "au";
      variant = "";
    };
    
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.nico = {
      isNormalUser = true;
      description = "nico";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "flatpak" "disk" "qemu" "kvm" "sshd" "networkmanager" "audio" "video" "root"];
      packages = with pkgs; [];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # List packages installed in system profile. To search, run:
    # $ nix search wget
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
    services.greetd.enable = true; # Enable greetd
    services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks";
    programs.kdeconnect.enable = true; # Enable kdeconnect
    programs.virt-manager.enable = true; # Enable virt-manager
    documentation.man.enable = true; # Enable more man pages
    services.cpupower-gui.enable = true; # Enable CPU power gui
    programs.zsh.enable = true; # Enable zsh shell
    users.defaultUserShell = pkgs.zsh;
    services.printing.enable = true; # Enable CUPS
    services.printing.cups-pdf.enable = true; # Enable CUPS PDF
    virtualisation.waydroid.enable = true; # Enable waydroid
    fonts.packages = [ pkgs.nerdfonts pkgs.corefonts pkgs.vistafonts ]; # Install nerd fonts
    services.flatpak.enable = true; # Enable flatpak
    services.upower.enable = true; # Enable upower
    security.polkit.enable = true; # Enables policy kit
    virtualisation.docker.enable = true; # Enables docker for distrobox

    services.pipewire.enable = true; # Enables pipewire
    services.pipewire.alsa.enable = true; # Enables alsa support
    services.pipewire.alsa.support32Bit = true; # Enables alsa 32bit support
    services.pipewire.pulse.enable = true; # Enables pulseaudio support
    
    
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
    
    # List services that you want to enable:
    
    # Enable the OpenSSH daemon.
    services.openssh.enable = true;
    services.openssh.settings.PasswordAuthentication = false;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
    
    # Automatic Garbage Collection
    nix.gc.automatic = true;
    nix.gc.dates = "weekly";
    nix.gc.options = "--delete-older-than 7d";

    # Automatic Updates
    system.autoUpgrade.enable = true;

    # Reduce swappiness
    boot.kernel.sysctl = { "vm.swappiness" = 10;};

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11"; # Did you read the comment?
  };
}
