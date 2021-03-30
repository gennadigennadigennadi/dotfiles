export KEYTIMEOUT=1

set fish_greeting

set -x XDG_CONFIG_HOME $HOME/.config
set -x ZDOTDIR $XDG_CONFIG_HOME/zsh

set -x XDEBUG_SESSION "gennadi"
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x EDITOR "nvim"
set -x VISUAL "nvim"

set -xp CDPATH /Volumes/development .

set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.composer/vendor/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.local/share/nvim/site/pack/packer/opt/vim-superman/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/ncurses/bin" $fish_user_paths

 alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"'
