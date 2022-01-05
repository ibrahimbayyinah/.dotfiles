# neofetch for flexing
# neofetch

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand suffix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.cache/zsh/zsh_history"
HISTSIZE=1000
SAVEHIST=5000
setopt appendhistory autocd notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Lines added by ibrahimbayyinah
autoload -U colors && colors
# PS1='[%n@%m %1~]%(#.#.$) '
# export PS1
#
# PS1='%F{red}┌┌%F{blue}(%F{yellow}%n%F{red}@%F{green}%m%F{blue})%F{red}-%F{blue}(%F{red}%D{%I:%M%P}%F{blue}-:-%F{red}%D{%m}%F{blue}%F{red}/%D{%d}%F{blue})%F{red}┌-%F{blue}¨%F{red}-¨¨%F{blue}˙
# %{%}%F{red}└┌%F{blue}(%F{magenta}%1~%F{blue})%F{red}┌¨%F{blue}˙%f'
#

# PROMPT:

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

# END OF PROMPT


#autoload -Uz promptinit && promptinit
#prompt elite

# source alias file if it exists:
[ -f $HOME/.config/aliasrc ] && source $HOME/.config/aliasrc

# Checking if user's local bin directory exists and isn't already in PATH. If both are true, prepending this directory to the PATH variable.
[[ -d $HOME/.local/bin && -z $(echo $PATH | grep -o $HOME/.local/bin) ]] && export PATH="$HOME/.local/bin:${PATH}"

# adding npm's global prefix to PATH:
[[ -d $HOME/.npm-global/bin && -z $(echo $PATH | grep -o $HOME/.npm-global/bin) ]] && export PATH="$HOME/.npm-global/bin:${PATH}"

# End of lines added by ibrahimbayyinah

# Load syntax highlighting; should be last. Check if the path is correct for your system
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
