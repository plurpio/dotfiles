{ config, pkgs, lib, ... }:

{
  #
  # ZSH Shell
  #

  # cli pkgs
  documentation.man.enable = true;
  environment.systemPackages = with pkgs; [ zoxide tlrc wget unzip killall jq ffmpeg
                                            neovim yt-dlp file uwufetch btop cava ripgrep
                                            eza bat];
    
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
}