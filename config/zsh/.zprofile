typeset -U path
#path=$("$HOME"/.local/bin $PATH)
systemctl --user import-environment PATH

if [[ -z "$DISPLAY" ]] && [[ -n "$XDG_VTNR" ]] && [[ "$XDG_VTNR" -eq 1 ]]; then
	if [[ ! -a "$XAUTHORITY" ]]; then
		[[ -d "XDG_RUNTIME_DIR"/X11 ]] || mkdir -p "$XDG_RUNTIME_DIR"/X11
		touch $XAUTHORITY
	fi
	exec systemd-cat -t startx startx 
fi
