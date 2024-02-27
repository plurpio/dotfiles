
# Sourcing
source "$XDG_CONFIG_DIR/zsh/alias.sh"
source "$XDG_CONFIG_DIR/zsh/flatpakAlias.sh"

# History 
HISTFILE="$XDG_CONFIG_DIR/zsh/.history"
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e

# Autocomplete
autoload -U colors && colors
zstyle :compinstall filename '$XDG_CONFIG_DIR/zsh/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

# Load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Prompt
PROMPT="%B%F{blue}󰣇%f%b%F{cyan} %f%K{cyan}%b%F{black}%~%k%F{cyan} %f"
RPROMPT="%{$fg[yellow]%}%n@%m"
