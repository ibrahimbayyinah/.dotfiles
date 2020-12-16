[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.config/.profile" ] && . "$HOME/.config/.profile"
[ -f "$HOME/.config/zsh/.zshrc" ] && . "$HOME/.config/zsh/.zshrc"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

[ `tty` = "/dev/tty1" ] && startx ~/.xinitrc dwm || [ `tty` = "/dev/tty2" ] && startx ~/.xinitrc bspwm
