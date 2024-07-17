#
# ZSH Shell
#

zstyle ':completion:*' menu select
setopt HIST_IGNORE_SPACE
eval "$(zoxide init zsh)"
bindkey -e

# Set history
HISTFILE="$HOME/.cache/history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Prompt
PROMPT='%F{blue}%~ %b%F{yellow}${vcs_info_msg_0_}%F{red}➜ %f'

# git info in rprompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b '

# Alias
alias ls="eza -Ah --color=auto --icons"
alias ll="eza -lAh --color=auto --icons"
alias cat="bat"
alias ".."="cd .."
alias "cd.."="cd .."
alias rm="rm -rf"
alias cls="clear"
alias quit="exit"

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias ytmp3="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-chapters --embed-metadata"
alias yt-dlp="yt-dlp --embed-thumbnail --embed-chapters --embed-metadata"
alias wget="wget --no-hsts"

alias gitlc="git log --branches --not --remotes" # Shows commits that have not been pushed
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gph="git push"
alias gpl="git pull"
alias py="python3"
alias pyve="source venv/bin/activate"
alias pyvec="python3 -m venv venv; source venv/bin/activate";

alias viu="kitty +icat"
alias run="nix run"
alias rebuild="doas nixos-rebuild switch --flake /home/nico/repos/dotfiles/nixos --impure"
alias sudo="echo \"use doas dummy :3\"; doas"
