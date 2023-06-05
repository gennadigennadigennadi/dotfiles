export KEYTIMEOUT=1

set -x XDG_CACHE_HOME $HOME/.cache/
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x PHP_CS_FIXER_IGNORE_ENV 1

set -x FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_DEFAULT_OPTS '--reverse'

set -xp CDPATH $HOME/Code .

set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.composer/vendor/bin" $fish_user_paths

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
abbr ports 'sudo lsof -i -P -n | grep LISTEN'

# alias hmd='cd ~/.dotfiles/nix/home-manager'
# alias hmp='home-manager packages'
# alias hms='home-manager switch --flake ~/.dotfiles/nix/home-manager#vlad'
# alias hmu='nix flake update ~/.dotfiles/nix/home-manager && hms'

abbr hms 'home-manager switch --flake ~/Code/dotfiles/config/home-manager/#gennadi'
abbr hmu 'nix flake update ~/Code/dotfiles/config/home-manager/ && home-manager switch --flake ~/Code/dotfiles/config/home-manager/#gennadi'

cat $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh | babelfish | source
