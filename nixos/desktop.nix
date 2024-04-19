{ config, pkgs, lib, inputs, ... }:

{
  #
  # Desktop applications and configurations.
  #

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;

  programs.waybar.enable = true;
  programs.kdeconnect.enable = true;

  # Enables desktop portals and polkit
  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  security.polkit.enable = true;

  # Enable login manager
  services.greetd.enable = true;
  services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland -t -r --asterisks";

  #
  # Terminal
  #

  home-manager.users.nico = {
    programs.kitty.enable = true;
    programs.kitty.font.name = "ComicShannsMono Nerd Font";
    programs.kitty.font.size = 20;
    programs.kitty.settings = {
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

  # Firefox
  programs.firefox.enable = true;

  # Chromium
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
    "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    "gebbhagfogifgggkldgodflihgfeippi" # return youtube dislike
    "hipekcciheckooncpjeljhnekcoolahp" # tabliss
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
  };

  #
  # Enable pipewire/audio
  #

  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.wireplumber.enable = true;

}
