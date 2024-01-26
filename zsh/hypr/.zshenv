ZDOTDIR="$HOME/.config/zsh/"; export ZDOTDIR
if [ -e /home/ibra/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ibra/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

source $HOME/.config/.senvs
