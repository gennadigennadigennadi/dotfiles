export KEYTIMEOUT=1

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache/
set -x XDG_DATA_HOME $HOME/.local/share

set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x PHP_CS_FIXER_IGNORE_ENV 1

set -x FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_DEFAULT_OPTS '--reverse'

set -xp CDPATH $HOME/code .

set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.composer/vendor/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.bin" $fish_user_paths
set -g fish_user_paths "/usr/local/bin/python3/bin" $fish_user_paths

# My aliases
# alias dotfiles 'git --git-dir=/Volumes/code/dotfiles/ --work-tree=$HOME'
# alias dot 'lazygit --git-dir=/Volumes/code/dotfiles/ --work-tree=$HOME'
abbr brewu 'brew update && brew upgrade'

abbr ll 'exa -gla --icons'
abbr l 'exa -gl --icons'
abbr ip 'ipconfig getifaddr en1'
abbr g 'git'
abbr v 'nvim'
abbr lg 'lazygit'

abbr code 'cd /Volumes/code/docker-mac-vagrant/'
abbr up 'cd /Volumes/code/docker-mac-vagrant/ && vagrant up && cd -'
abbr down 'cd /Volumes/code/docker-mac-vagrant/ && vagrant halt && cd -'
abbr workbox 'ssh -t vagrant@workbox "cd /Volumes/code/ ; bash"'
