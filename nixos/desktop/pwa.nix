{ config, pkgs, lib, ... }:

{
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
}
