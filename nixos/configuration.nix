{ config, pkgs, lib, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.nico = import ./hm.nix;
  };

  # Enable desktop programs
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  programs.firefox.enable = true;
  programs.waybar.enable = true;
  programs.kdeconnect.enable = true;

  # Enable onedrive
  services.onedrive.enable = true;

  # ZSH Shell
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.histFile = "$HOME/.cache/zsh_history";
  programs.zsh.histSize = 1000000;
  users.defaultUserShell = pkgs.zsh;
  environment.shellAliases = {
    ls="ls -ah --color=auto";
    ll="ls -lah --color=auto";
    cat="bat";
    ".."="cd ..";
    "cd.."="cd ..";
    "~"="cd ~";
    rm="rm -rf";
    cls="clear";
    quit="exit";
    vim="nvim";
    vi="nvim";
    v="nvim";
    py="python3";
    pyve="source venv/bin/activate";
    pyvec="python3 -m venv venv; source venv/bin/activate";
    gitlc="git log --branches --not --remotes"; # Shows commits that have not been pushed
    pmode="sudo cpupower frequency-set -g";
    ytmp3="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-chapters --embed-metadata";
    yt-dlp="yt-dlp --embed-thumbnail --embed-chapters --embed-metadata";
    wget="wget --no-hsts";
    viu="kitty +icat";
    sudo="echo \"use doas dummy :3\"; doas";
    virsh="virsh --connect=qemu:///system";
  };

  # Enables desktop portals and polkit
  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  security.polkit.enable = true;

  systemd = {
    user.services.polkit-kde-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
  }; }; };

  # Enable printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin pkgs.cnijfilter2];

  # Power settings
  services.upower.enable = true;
  services.tlp.enable = true;

  # Enable pipewire/audio
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.wireplumber.enable = true;

  # Enable virtualisation
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
  virtualisation.libvirtd.qemu.swtpm.enable = true;

  virtualisation.vmware.host.enable = true; # virt-manager doesnt work rn

  virtualisation.waydroid.enable = true;
  virtualisation.docker.enable = true;

  # Enable login manager
  services.greetd.enable = true;
  services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks";

  # Miscellaneous
  documentation.man.enable = true;
  hardware.opengl.enable = true;

  #
  # User settings
  #

  users.users.nico = {
  isNormalUser = true;
  description = "nico";
  extraGroups = ["networkmanager" "wheel" "docker" "libvirtd" "flatpak" "disk"
                 "qemu" "kvm" "sshd" "networkmanager" "audio" "video" "root"];};

  # Fonts
  fonts.packages = [ pkgs.nerdfonts pkgs.corefonts pkgs.vistafonts pkgs.google-fonts pkgs.noto-fonts pkgs.noto-fonts-emoji];
  fonts.fontDir.enable = true;

  # Set your time zone and locale
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

  #
  # Package manager settings
  #

  # Nix pkg manager configuration
  nixpkgs.config.allowUnfree = true;

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
  # System Settings
  # 

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "penguin";
  networking.networkmanager.enable = true;

  # SSH
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.AllowUsers = [ "nico" ];
  users.users.nico.openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNBlGMXuW0wcZLOtbidBH+Q/XNShld6QEIs2g72jBKxsbopfVP+VSBLAEaIQvExk+osVQSqcRyK0HXY+JOIJcWn04Bb1DwXhP6aYbmY79rwA1uDMCNFwwDdOvF6pqbXwYIRxKE1xPgVi9aLfS+QM14yHVspf5GzqO+Rgn2ePL5XV23w/ljumQ5U13ucg73uhAtkBDJk1+lE8Yj6kRlVQf+gLOaEl+4fY8/9nxd6HefEJaAg88vu4QT9kDL55u2erZo7lMS3mqvVaONG97gogoQJw+n1AnG4PkwaAMcvEKzdp6tUfKgfqXyeXDFxAWkZBBS3X8QphhjyYj+uyQbF50b" ];

  # Automatic Garbage Collection
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";

  # Automatic Updates
  system.autoUpgrade = {
      enable = true;
      flags = [ "--update-input" "nixpkgs" ];
      dates = "02:00";
      randomizedDelaySec = "45min";
      persistent = true;
    };

  # Kernel options
  boot.kernel.sysctl = { "vm.swappiness" = 10;};
  boot.kernel.sysctl."kernel.sysrq" = 1;

  # Replace sudo with doas
  security.doas.enable = true;
  security.doas.extraConfig = "permit keepenv persist :wheel";
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
