# neofetch for flexing
# neofetch

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (cat ~/.cache/wal/sequences &)
# . ~/.cache/wal/colors.sh

# env variables
# export XDG_CONFIG_HOME=$HOME/.config

# Put .zcompdump in user's cache dir (inspiration: https://dev.to/voyeg3r/some-pearls-from-my-zshrc-282m)
export ZSH_ZCOMPDUMP=$Home/.cache/zsh/.zcompdump

# Lines added by ibrahimbayyinah
autoload -U colors && colors
# End of lines added by ibrahimbayyinah

# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=5000
HISTFILE=$HOME/.cache/zsh/zsh_history
setopt appendhistory autocd notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall and modified by ibrahimbayyinah (taken from Luke Smith's .zshrc):

autoload -Uz compinit

zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand suffix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/ibra/.config/.zshrc'
zmodload zsh/complist
compinit -d $ZSH_ZCOMPDUMP # Put .zcompdump in user's cache dir
# End of lines added by compinstall

# Taken from Luke Smith:

# Include hidden files in autocomplete:
_comp_options+=(globdots)
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char 

# Change cursor shape for different vi modes:
function zle-keymap-select {
       if [[ ${KEYMAP} == vicmd ]] ||
          [[ $1 = 'block' ]]; then
         echo -ne '\e[1 q'

       elif [[ ${KEYMAP} == main ]] ||	 
	    [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
	    [[ $1 = 'beam' ]]; then
	 echo -ne '\e[5 q'
       fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap
    echo -ne "\e[5 q"
}
zle -N zle-line-init
# Use beam shape on startup:
echo -ne '\e[5 q'
# Use beam shape for each new prompt:
preexec() { echo -ne '\e[5 q' ;}

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# End of lines taken from Luke Smith

# The following lines were added by ibrahimbayyinah (edited from oh-my-zsh):

# CONFIGURING PROMPT:

# PS1='[%n@%m %1~]%(#.#.$) '
# PS1='%F{red}┌┌%F{blue}(%F{yellow}%n%F{red}@%F{green}%m%F{blue})%F{red}-%F{blue}(%F{red}%D{%I:%M%P}%F{blue}-:-%F{red}%D{%m}%F{blue}%F{red}/%D{%d}%F{blue})%F{red}┌-%F{blue}¨%F{red}-¨¨%F{blue}˙
# %{%}%F{red}└┌%F{blue}(%F{magenta}%1~%F{blue})%F{red}┌¨%F{blue}˙%f'
# export PS1
# autoload -Uz promptinit && promptinit
# prompt elite

setopt prompt_subst

[ -f "$HOME/.config/zsh/git.zsh" ] && source "$HOME/.config/zsh/git.zsh"

# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

PROMPT="%{$fg[cyan]%}%c %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT="%{$fg[#3F8D62]%}%c %(?:%{$fg_bold[${color2}]%}➜ :%{$fg_bold[${color1}]%}➜ )"
PROMPT+='%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# END OF PROMPT CONFIGURATION

# source alias file if it exists:
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Checking if user's local bin directory exists and isn't already in path. If both are true, prepending this directory to the PATH variable.
[ -d $HOME/.local/bin ] && [ -z $(echo $PATH | grep -o $HOME/.local/bin) ] && export PATH="$HOME/.local/bin:${PATH}"
[ -d $HOME/bin ] && [ -z $(echo $PATH | grep -o $HOME/bin) ] && export PATH="$HOME/bin:${PATH}"
# Idem with local scripts directory
[ -d $HOME/.local/scripts ] && [ -z $(echo $PATH | grep -o $HOME/.local/scripts) ] && export PATH="$HOME/.local/scripts:${PATH}"

# Setting up environment variables for go:
GOPATH="$HOME/programs/go/go_projects"; export GOPATH
GOBIN="$GOPATH/bin"; export GOBIN
GOROOT="/usr/local/go"; export GOROOT
# set PATH so it includes go bin if it exists
[ -z $(echo $PATH | grep -o $GOROOT/bin) ] && [ -d "$GOROOT/bin" ] && PATH="$PATH:$GOROOT/bin"; export PATH

# Adding ~/.cargo/bin to PATH
[ -d $HOME/.cargo/bin ] && [ -z $(echo $PATH | grep -o $HOME/bin) ] && export PATH="$HOME/.cargo/bin:${PATH}"

# fnm environment variables for zsh:
# eval "$(fnm env)"
# eval "$(fnm env --use-on-cd)"
# export PATH="/run/user/1000/fnm_multishells/112364_1667539036498/bin":$PATH
# export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/112364_1667539036498"
# export FNM_VERSION_FILE_STRATEGY="local"
# export FNM_DIR="/home/ibra/.local/share/fnm"
# export FNM_LOGLEVEL="info"
# export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
# # exportautoload -U add-zsh-hook
# # _fnm_autoload_hook () {
# #     if [[ -f .node-version || -f .nvmrc ]]; then
# #     fnm use --silent-if-unchanged
# # fi
# # 
# # }
# # 
# # add-zsh-hook chpwd _fnm_autoload_hook \
# #     && _fnm_autoload_hook FNM_ARCH="x64"
# 
# rehash

# TERMINAL='st'; export TERMINAL # setting the TERMINAL environment variable to be st
TERMINAL='kitty'; export TERMINAL # setting the TERMINAL environment variable

# pnpm
export PNPM_HOME="/home/ibra/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# nvm: node & npm version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# End of lines added by ibrahimbayyinah

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ibra/builds/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ibra/builds/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ibra/builds/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ibra/builds/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
# End of gcloud


# android
export ANDROID_HOME="$HOME/builds/android/android_sdk"
[ -d "$ANDROID_HOME/tools" ] && PATH="$PATH:$ANDROID_HOME/tools"; export PATH
[ -d "$ANDROID_HOME/tools/bin" ] && PATH="$PATH:$ANDROID_HOME/tools/bin"; export PATH
[ -d "$ANDROID_HOME/cmdline-tools/latest" ] && PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest"; export PATH
[ -d "$ANDROID_HOME/cmdline-tools/latest/bin" ] && PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"; export PATH
[ -d "$ANDROID_HOME/platform-tools" ] && PATH="$PATH:$ANDROID_HOME/platform-tools"; export PATH
[ -d "$ANDROID_HOME/build-tools/33.0.0" ] && PATH="$PATH:$ANDROID_HOME/build-tools/33.0.0"; export PATH
[ -d "$ANDROID_HOME/emulator" ] && PATH="$PATH:$ANDROID_HOME/emulator"; export PATH
# End of android


# Load zsh-syntax-highlighting; should be last (modified from Luke Smith's .zshrc to work with void):
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
