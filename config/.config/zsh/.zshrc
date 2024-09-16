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

# Bind ctrl+f to zi
bindkey -s '^F' 'zi\r'

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
alias rm="trash-put"
alias cls="clear"
alias quit="exit"

alias rm="trash-put"
alias rmls="trash-list"
alias rmr="trash-restore"
alias rmempty="trash-empty"

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
alias gpl="git pull --rebase"
alias gl="git log"
alias py="python3"
alias pyve="source venv/bin/activate" alias pyvec="python3 -m venv venv; source venv/bin/activate";

alias viu="kitty +icat"
alias run="nix run"
alias sudo="echo \"use doas dummy :3\"; doas"

alias rebuild="doas nixos-rebuild switch --flake /home/nico/repos/dotfiles/nixos --impure"
alias stowa="stow -R -t ~ -d $HOME/repos/dotfiles config --no-folding"

alias botp="btop" # done this wayy too many times

# Auto install plugins
export ZSH_PLUGIN_DIR=$XDG_CACHE_HOME/purp/zsh
if [ ! -d "$ZSH_PLUGIN_DIR" ]; then
  if ! command -v git > /dev/null; then
    echo "git is not installed. please install it to enable plugins."
  else
    mkdir -p "$ZSH_PLUGIN_DIR"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGIN_DIR/zsh-autosuggestions"
    source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
  fi
else
  source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
  
# SSHed conditions
if [[ -v SSH_TTY ]]; then
  fastfetch
fi
