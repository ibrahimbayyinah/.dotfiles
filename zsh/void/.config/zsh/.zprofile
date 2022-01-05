[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.config/zsh/.zshrc" ] && . "$HOME/.config/zsh/.zshrc"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

[ `tty` = "/dev/tty1" ] && startx
