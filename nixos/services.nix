{ config, pkgs, ... }:

{
  config = {
    programs.kdeconnect.enable = true; # Enable kdeconnect
    documentation.man.enable = true; # Enable more man pages
    services.cpupower-gui.enable = true; # Enable CPU power gui
    services.upower.enable = true; # Enable upower
    security.polkit.enable = true; # Enables policy kit

    services.logind.extraConfig = ''HandlePowerKey=ignore'';

    services.printing.enable = true; # Enable CUPS
    services.printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin pkgs.cnijfilter2]; # Adds printer support

    programs.virt-manager.enable = true; # Enable virt-manager
    virtualisation.waydroid.enable = true; # Enable waydroid
    virtualisation.docker.enable = true; # Enables docker for distrobox

    programs.zsh.enable = true; # Enable zsh shell
    programs.zsh.autosuggestions.enable = true; # Enable zsh autosuggestions
    programs.zsh.syntaxHighlighting.enable = true; # Enable zsh highlighting
    users.defaultUserShell = pkgs.zsh;

    services.pipewire.enable = true; # Enables pipewire
    services.pipewire.alsa.enable = true; # Enables alsa support
    services.pipewire.alsa.support32Bit = true; # Enables alsa 32bit support
    services.pipewire.pulse.enable = true; # Enables pulseaudio support
    services.pipewire.wireplumber.enable = true; # Enable wireplumber

    xdg.portal.enable = true; # Enables xdg desktop portals
    xdg.portal.wlr.enable = true;
    xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];

    hardware.opengl.enable = true;

    }; }
