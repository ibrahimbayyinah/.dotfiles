[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.config/zsh/.zshrc" ] && . "$HOME/.config/zsh/.zshrc"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[ `tty` = "/dev/tty1" ] && ~/.local/bin/wrappedhl
