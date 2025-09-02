zoxide init fish --cmd cd | source
starship init fish | source
jj util completion fish | source

set -Ux UID (id -u)
# set -Ux DOCKER_HOST ""
# set -Ux HOST (ipconfig getifaddr en0)

set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux JJ_CONFIG $XDG_CONFIG_HOME/jj/config.toml
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux PHP_CS_FIXER_IGNORE_ENV 1

# remove fish greeting
set -U fish_greeting

set -U fish_user_paths /opt/homebrew/opt/uutils-coreutils/libexec/uubin $fish_user_paths

set -U fish_user_paths /opt/homebrew/opt/mysql-client@8.4/bin $fish_user_paths
set -U fish_user_paths ~/.local/bin $fish_user_paths
set -U fish_user_paths  $fish_user_paths

abbr brewu 'brew update && brew upgrade'

abbr dc 'docker compose'
abbr c 'composer'
abbr m 'make'
abbr g 'git'
abbr v 'NVIM_APPNAME=lazyvim nvim'
abbr vv 'NVIM_APPNAME=v12 nvim'
abbr n 'nvim'
abbr lg 'lazygit'

abbr ip 'ipconfig getifaddr en0'

abbr ms 'mutagen sync'
abbr msc 'mutagen sync create'
abbr msm 'mutagen sync monitor -l'

alias l 'eza -gl --icons=auto'
alias ll 'eza -gla --icons=auto --group-directories-first'
