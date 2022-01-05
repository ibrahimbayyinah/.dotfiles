# neofetch for flexing
# neofetch

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
compinit
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
# %{%}%F{red}└┌%F{blue}(%F{magenta}%1~%F{blue})%F{red}┌¨%F{blue}˙%f'
# export PS1
# autoload -Uz promptinit && promptinit
# prompt elite

setopt prompt_subst

[ -f "$HOME/.config/zsh/git.zsh" ] && source "$HOME/.config/zsh/git.zsh"

# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

PROMPT="%{$fg[cyan]%}%c %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
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

# Setting up environment variables for go:
GOPATH="$HOME/programs/go/go_projects"; export GOPATH
GOBIN="$GOPATH/bin"; export GOBIN
GOROOT="/usr/local/go"; export GOROOT
# set PATH so it includes go bin if it exists
[ -z $(echo $PATH | grep -o $GOROOT/bin) ] && [ -d "$GOROOT/bin" ] && PATH="$PATH:$GOROOT/bin"; export PATH

TERMINAL='st'; export TERMINAL # setting the TERMINAL environment variable to be st
# End of lines added by ibrahimbayyinah

# Load zsh-syntax-highlighting; should be last (modified from Luke Smith's .zshrc to work with void):
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
