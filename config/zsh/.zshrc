#  ▄▄▄▄▄▄▄ ▄▄▄     ▄▄   ▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ ▄▄▄ ▄▄▄▄▄▄▄ 
# █       █   █   █  █ █  █   ▄  █ █       █   █       █
# █    ▄  █   █   █  █ █  █  █ █ █ █    ▄  █   █   ▄   █
# █   █▄█ █   █   █  █▄█  █   █▄▄█▄█   █▄█ █   █  █ █  █
# █    ▄▄▄█   █▄▄▄█       █    ▄▄  █    ▄▄▄█   █  █▄█  █
# █   █   █       █       █   █  █ █   █   █   █       █
# █▄▄▄█   █▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█  █▄█▄▄▄█   █▄▄▄█▄▄▄▄▄▄▄█

# History 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# Autocomplete
autoload -U colors && colors
zstyle :compinstall filename '/home/alex/.zshrc'
autoload -Uz compinit
compinit

# Load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
PROMPT="%~ %{$fg[cyan]%}$ "
RPROMPT="%{$fg[red]%}%n@%m"

# Set enviroment variables
EDITOR=nvim

# Alias

# General alias
alias sudo='doas'

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

# Pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
