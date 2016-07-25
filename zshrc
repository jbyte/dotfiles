# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' prompt 'corr%e'
zstyle :compinstall filename '/home/jbyte/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
#
#
### ALIASES
alias ls="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -a"
alias lla="ls --color -alh"

alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"

alias lck="livestreamer www.twitch.tv/lck1 high"
alias eulcs1="livestreamer www.twitch.tv/eulcs1 high"
alias eulcs2="livestreamer www.twitch.tv/eulcs2 high"
alias nalcs1="livestreamer www.twitch.tv/nalcs1 high"
alias nalcs2="livestreamer www.twitch.tv/nalcs2 high"


export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export MAIL=/var/spool/mail/jbyte
export TERM=xterm-256color

#. /oth/powerline/powerline/powerline/bindings/zsh/powerline.zsh

POWERLEVEL9K_MODE='awesome-fontconfig'

source ~/oth_projects/powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)

POWERLEVEL9K_SHOW_CHANGESET=true

connect-wifi(){
    sudo ip link set wlp3s0 down
    sudo wifi-menu
}
