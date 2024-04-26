{ config, pkgs, lib, ... }:

{
  
  #
  # Nix
  #
  
  environment.systemPackages = with pkgs; [
    # System
    gparted
  ];

  #
  # Flatpaks
  #

  services.flatpak.packages = [
      # files
      "org.filezillaproject.Filezilla"

      # note taking
      "md.obsidian.Obsidian"

      # social
      "org.signal.Signal"

      # games
      "com.valvesoftware.Steam"
      "net.davidotek.pupgui2"
      "org.prismlauncher.PrismLauncher"
      "com.heroicgameslauncher.hgl"
      "io.itch.itch"

      # downloading cars
      "com.transmissionbt.Transmission"
    ];

}
