{ config, pkgs, lib, ... }:

{

  services.flatpak.packages = [
      #
      # media creation/modification
      #

      "org.kde.kdenlive"
      "org.kde.krita"
      "org.audacityteam.Audacity"
      "org.upscayl.Upscayl"
      "org.gimp.GIMP"
    ];

  environment.systemPackages = with pkgs; [
  
    vlc
    obs-studio
    helvum

    # Enable spotify
    spotify

  ];
  
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
  # Enable V4L2 loopback ( for OBS virtual camera )
  #

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];

}
