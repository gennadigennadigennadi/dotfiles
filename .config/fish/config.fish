export KEYTIMEOUT=1

# starship init fish | source

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.local/share

set -x XDEBUG_SESSION "gennadi"
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

set -x EDITOR "nvim"
set -x VISUAL "nvim"

set -x FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
# set -x FZF_ALT_C_COMMAND "fd --type directory --follow --exclude .git . $HOME"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_DEFAULT_OPTS '--reverse'

set -xp CDPATH /Volumes/dev .

set -g fish_user_paths "$HOME/.local/share/nvim/site/pack/packer/opt/vim-superman/bin"
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.composer/vendor/bin" $fish_user_paths
# set -g fish_user_paths "/opt/homebrew/opt/ncurses/bin" $fish_user_paths
# set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.bin" $fish_user_paths
set -g fish_user_paths "/usr/local/bin/python3/bin" $fish_user_paths

# My aliases
alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"'
alias l='exa -gl --icons'
alias la='l -a'
alias v='nvim'
alias lg='lazygit'
alias ld='lazydocker'
alias brewu='brew update && brew upgrade'
alias dotfiles='git --git-dir=/Volumes/code/dotfiles/ --work-tree=$HOME'

alias dev='cd /Volumes/code/docker-mac-vagrant/'
alias dev-up='cd /Volumes/code/docker-mac-vagrant/ && vagrant up && cd -'
alias dev-ssh='cd /Volumes/code/docker-mac-vagrant/ && vagrant ssh'
