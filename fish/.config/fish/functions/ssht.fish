function ssht
	set -x TERM xterm-256color
	ssh root@$argv -t tmux new -As mark fish
end
