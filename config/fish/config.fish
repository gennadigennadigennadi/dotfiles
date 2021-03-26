function fish_mode_prompt
	switch $fish_bind_mode
		case default
			set_color --bold red
			printf '\e]50;CursorShape=0\x7'
			echo '●'
		case insert
			set_color --bold green
			printf '\e]50;CursorShape=1\x7'
			echo '●'
		case replace_one
			set_color --bold yellow
			printf '\e]50;CursorShape=2\x7'
			echo '●'
		case visual
			set_color --bold brmagenta
			echo '●'
		case '*'
			set_color --bold red
			echo '●'
	end
	set_color normal
	echo ' '
end
export KEYTIMEOUT=1

set -x XDG_CONFIG_HOME $HOME/.config
set -x ZDOTDIR $XDG_CONFIG_HOME/zsh

set -x XDEBUG_SESSION "gennadi"
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x EDITOR "nvim"
set -x VISUAL "nvim"

# set -x PATH "/opt/homebrew/opt/llvm/bin:$PATH"
# set -x PATH="/opt/homebrew/opt/bison/bin:$PATH"
# set -x PATH="/opt/homebrew/opt/libiconv/bin:$PATH"

set fish_greeting
set -xp PATH /opt/homebrew/bin "$HOME/.bin" "$HOME/.local/share/nvim/site/pack/packer/start/vim-superman/bin/vman"
set -xp CDPATH /Volumes/development .
