#!/bin/sh

dir="${BASH_SOURCE%/*}"

echo 'init Xcode'
. "$dir/_init_xcode.sh"

echo 'init _shell'
. "$dir/_init_shell.sh"

echo 'init symlinks'
. "$dir/_create_symbolic_links.sh"

echo 'setup vim plugins'
. "$dir/_setup_vim_plugins.sh"