# History 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# Autocomplete
autoload -U colors && colors
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

# Load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
PROMPT="%B%F{blue}󰣇%f%b%F{cyan} %f%K{cyan}%b%F{black}%~%k%F{cyan} %f"
RPROMPT="%{$fg[yellow]%}%n@%m"

# Get contents of directory/files
alias ls='ls -ah --color=auto'
alias ll='ls -lah --color=auto'
alias cat='bat'

# Change directory alias
alias ..='cd ..'
alias cd..='cd ..'
alias ~='cd ~'

# Remove/quit alias
alias rm='rm -rf'
alias cls='clear'
alias quit='exit'

# Neovim alias
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# Development tool alias
alias py='python3'
alias gitlc='git log --branches --not --remotes' # Shows commits that have not been pushed

# Hardware alias
alias pmode='sudo cpupower frequency-set -g'
