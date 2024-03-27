# Alias

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

alias py='python3'
alias pyve='source venv/bin/activate'
alias pyvec='python3 -m venv venv; source venv/bin/activate'
alias gitlc='git log --branches --not --remotes' # Shows commits that have not been pushed
alias pmode='sudo cpupower frequency-set -g'
alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-chapters --embed-metadata'
alias yt-dlp='yt-dlp --embed-thumbnail --embed-chapters --embed-metadata'
alias wget='wget --no-hsts'
alias viu='kitty +icat'
alias sudo='echo "use doas dummy :3"; doas'

# Flatpak alias
alias flatpak="rm $XDG_CONFIG_HOME/zsh/flatpakAlias.sh; python3 $XDG_CONFIG_HOME/zsh/flatpakAlias.py $XDG_CONFIG_HOME/zsh/flatpakAlias.sh; source $XDG_CONFIG_HOME/zsh/flatpakAlias.sh; flatpak $@" # ik this wont do it for new app but its 2am and it wasn't working
