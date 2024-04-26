{ config, pkgs, lib, ... }:

{
  #
  # ZSH Shell
  #

  # cli pkgs
  documentation.man.enable = true;
  environment.systemPackages = with pkgs; [ zoxide tlrc wget unzip killall jq ffmpeg
                                            neovim yt-dlp file uwufetch btop cava ripgrep];
    
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.histFile = "$HOME/.cache/zsh_history";
  programs.zsh.histSize = 1000000;
  programs.zsh.promptInit = ''
    zstyle ':completion:*' menu select
    bindkey -e; eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
    PROMPT="%F{cyan}%f%k%K{cyan}%F{black} %f%k%F{cyan}%f "
    RPROMPT='%F{white}%f%k%K{white}%F{black}  %~%f%k%F{white}%f %F{blue}%f%K{blue}%F{black}%n%f%k%K{blue}%F{black}@%f%k%K{blue}%F{black}%m%f%k%F{blue}%f'
'';

  users.defaultUserShell = pkgs.zsh;
  environment.shellAliases = {
    ls="${pkgs.eza}/bin/eza -Ah --color=auto --icons";
    ll="${pkgs.eza}/bin/eza -lAh --color=auto --icons";
    l1="${pkgs.eza}/bin/eza -lAh --color=auto --level 1 --icons";
    l2="${pkgs.eza}/bin/eza -lAh --color=auto --level 2 --icons";
    cat="${pkgs.bat}/bin/bat";
    ".."="cd ..";
    "cd.."="cd ..";
    "~"="cd ~";
    rm="rm -rf";
    cls="clear";
    quit="exit";
    vim="${pkgs.neovim}/bin/nvim";
    vi="${pkgs.neovim}/bin/nvim";
    v="${pkgs.neovim}/bin/nvim";
    py="python3";
    pyve="source venv/bin/activate";
    pyvec="python3 -m venv venv; source venv/bin/activate";
    ytmp3="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-chapters --embed-metadata";
    yt-dlp="yt-dlp --embed-thumbnail --embed-chapters --embed-metadata";
    wget="wget --no-hsts";
    viu="kitty +icat";
    sudo="echo \"use doas dummy :3\"; ${pkgs.doas}/bin/doas";
    virsh="virsh --connect=qemu:///system";
    run="nix run";
    rebuild="doas nixos-rebuild switch --flake /home/nico/repos/dotfiles/nixos --impure";
  };

  environment.sessionVariables = rec {
    XDG_DESKTOP_DIR="$HOME/docs";
    XDG_DOCUMENTS_DIR="$HOME/docs";
    XDG_DOWNLOAD_DIR="$HOME/dl";
    XDG_MUSIC_DIR="$HOME/media/music";
    XDG_PICTURES_DIR="$HOME/pics";
    XDG_PUBLICSHARE_DIR="$HOME/media/public";
    XDG_TEMPLATES_DIR="$HOME/docs/templates";
    XDG_VIDEOS_DIR="$HOME/media/video";
    XDG_CONFIG_HOME="$HOME/.config";
    XDG_CACHE_HOME="$HOME/.cache";
    XDG_DATA_HOME="$HOME/.local/share";
    XDG_STATE_HOME="$HOME/.local/state";
    PATH="$HOME/.local/bin:$PATH";
    EDITOR="nvim";
    TERMINAL="kitty";
    ZDOTDIR="$XDG_CONFIG_HOME/zsh";
    PYTHONSTARTUP="~/.config/pythonrc";
    GOPATH="$XDG_DATA_HOME/go";
    CARGO_HOME="$XDG_DATA_HOME/cargo";
  };
}
