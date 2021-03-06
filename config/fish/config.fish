export KEYTIMEOUT=1

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDEBUG_SESSION "gennadi"
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

set -x EDITOR "nvim"
set -x VISUAL "nvim"

set -x FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
# set -x FZF_ALT_C_COMMAND "fd --type directory --follow --exclude .git . $HOME"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_DEFAULT_OPTS '--reverse'

set -xp CDPATH /Volumes/development .

set -g fish_user_paths "$HOME/.composer/vendor/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/ncurses/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.local/share/nvim/site/pack/packer/opt/vim-superman/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.bin" $fish_user_paths

# My aliases
alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"'
alias l='exa -gl --icons'
alias la='l -a'
alias v='nvim'
alias brewu='brew update && brew upgrade'
