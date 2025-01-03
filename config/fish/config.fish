zoxide init fish --cmd cd | source

set -Ux UID (id -u)
# set -Ux DOCKER_HOST ""

set -Ux XDG_CONFIG_HOME "$HOME/.config"
# set -Ux COLIMA_HOME "$HOME/.config/colima"

set -U fish_user_paths /opt/homebrew/opt/coreutils/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/gawk/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/zip/bin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/findutils/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/gnu-which/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/gnu-sed/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/gnu-tar/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/grep/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/make/libexec/gnubin $fish_user_paths
set -U fish_user_paths /opt/homebrew/opt/mysql-client@8.4/bin $fish_user_paths
set -U fish_user_paths  $fish_user_paths

abbr brewu 'brew update && brew upgrade'

abbr ll 'eza -gla --icons=auto'
abbr dc 'docker compose'
abbr c 'composer'
abbr mc 'mutagen-compose'
abbr m 'make'
abbr l 'eza -gl --icons=auto'
abbr ip 'ipconfig getifaddr en1'

abbr g 'git'
abbr v 'nvim'
abbr lg 'lazygit'
