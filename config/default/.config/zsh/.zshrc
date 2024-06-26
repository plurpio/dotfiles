#
# ZSH Shell
#

zstyle ':completion:*' menu select
eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
bindkey -e

# Prompt
PROMPT="%F{cyan}%f%k%K{cyan}%F{black} %f%k%F{cyan}%f "
RPROMPT='%F{white}%f%k%K{white}%F{black}  %~%f%k%F{white}%f %F{blue}%f%K{blue}%F{black}%n%f%k%K{blue}%F{black}@%f%k%K{blue}%F{black}%m%f%k%F{blue}%f'

# Alias
alias ls="eza -Ah --color=auto --icons"
alias ll="eza -lAh --color=auto --icons"
alias l1="eza -lAh --color=auto --level 1 --icons"
alias l2="eza -lAh --color=auto --level 2 --icons"
alias cat="bat"
alias ".."="cd .."
alias "cd.."="cd .."
alias "~"="cd ~"
alias rm="rm -rf"
alias cls="clear"
alias quit="exit"
alias vim="${pkgs.neovim}/bin/nvim"
alias vi="${pkgs.neovim}/bin/nvim"
alias v="${pkgs.neovim}/bin/nvim"
alias py="python3"
alias pyve="source venv/bin/activate"
alias pyvec="python3 -m venv venv source venv/bin/activate";
alias ytmp3="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-chapters --embed-metadata"
alias yt-dlp="yt-dlp --embed-thumbnail --embed-chapters --embed-metadata"
alias wget="wget --no-hsts"
alias viu="kitty +icat"
alias sudo="echo \"use doas dummy :3\"; doas"
alias run="nix run"
alias rebuild="doas nixos-rebuild switch --flake /home/nico/repos/dotfiles/nixos --impure"