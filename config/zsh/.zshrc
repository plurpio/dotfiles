
# Sourcing
source "$XDG_CONFIG_HOME/zsh/alias.sh"
source "$XDG_CONFIG_HOME/zsh/flatpakAlias.sh"
source "$XDG_CONFIG_HOME/zsh/zoxide.sh"

# History 
HISTFILE="$XDG_CONFIG_HOME/zsh/.history"
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e

# Autocomplete
autoload -U colors && colors
zstyle :compinstall filename '$XDG_CONFIG_HOME/zsh/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

# Load plugins
source "$XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Prompt
PROMPT="%F{magenta}%f%K{magenta}%F{black}  %f%k%K{magenta}%F{blue}%f%k%K{blue}%F{black}%~%f%k%F{blue}%f "
RPROMPT="%{$fg[yellow]%}%n@%m"
