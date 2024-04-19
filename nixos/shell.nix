{ config, pkgs, lib, ... }:

{
  # ZSH Shell
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.histFile = "$HOME/.cache/zsh_history";
  programs.zsh.histSize = 1000000;
  programs.zsh.promptInit = ''
    zstyle ':completion:*' menu select
    bindkey -e; eval "$(zoxide init zsh)"
    PROMPT="%F{magenta}%f%K{magenta}%F{black}  %f%k%K{magenta}%F{blue}%f%k%K{blue}%F{black}%~%f%k%F{blue}%f "
    RPROMPT="%{$fg[yellow]%}%n@%m" '';

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
    run="nix run nixpkgs#";
  };

  environment.sessionVariables = rec {
    XDG_DESKTOP_DIR="$HOME/docs";
    XDG_DOCUMENTS_DIR="$HOME/docs";
    XDG_DOWNLOAD_DIR="$HOME/dl";
    XDG_MUSIC_DIR="$HOME/media/music";
    XDG_PICTURES_DIR="$HOME/pics";
    XDG_PUBLICSHARE_DIR="$HOME/media/public";
    XDG_TEMPLATES_DIR="$HOME/docs/templates";
    XDG_VIDEOS_DIR="$HOME/media/rec";
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
  };
}
