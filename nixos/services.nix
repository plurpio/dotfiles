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
    services.printing.cups-pdf.enable = true; # Enable CUPS PDF

    programs.virt-manager.enable = true; # Enable virt-manager
    virtualisation.waydroid.enable = true; # Enable waydroid
    virtualisation.docker.enable = true; # Enables docker for distrobox

    programs.zsh.enable = true; # Enable zsh shell
    users.defaultUserShell = pkgs.zsh;

    services.pipewire.enable = true; # Enables pipewire
    services.pipewire.alsa.enable = true; # Enables alsa support
    services.pipewire.alsa.support32Bit = true; # Enables alsa 32bit support
    services.pipewire.pulse.enable = true; # Enables pulseaudio support
    services.pipewire.wireplumber.enable = true; # Enable wireplumber
    };
}
