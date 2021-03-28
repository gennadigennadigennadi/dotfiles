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
