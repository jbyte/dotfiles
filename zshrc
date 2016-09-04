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

# listing
alias ls="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -a"
alias lla="ls --color -alh"

# editing/sourcing this file
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"

# leagueoflegends streams
alias lck="livestreamer www.twitch.tv/lck1 high"
alias eulcs1="livestreamer www.twitch.tv/eulcs1 high"
alias eulcs2="livestreamer www.twitch.tv/eulcs2 high"
alias nalcs1="livestreamer www.twitch.tv/nalcs1 high"
alias nalcs2="livestreamer www.twitch.tv/nalcs2 high"

# git aliases
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gdt="git difftool"
alias gm="git merge"
alias gmt="git mergetool"


### EXPORTS
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export MAIL=/var/spool/mail/jbyte
export TERM=xterm-256color
# add lavarel exe to path
# TODO: find better place to have this
export PATH=$PATH:~/.config/composer/vendor/bin/

# add ruby/travis cli to path
export PATH=$PATH:~/.gem/ruby/2.3.0/bin/

#. /oth/powerline/powerline/powerline/bindings/zsh/powerline.zsh

POWERLEVEL9K_MODE='awesome-fontconfig'

source ~/.powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)

POWERLEVEL9K_SHOW_CHANGESET=true

connect-wifi(){
    sudo ip link set wlp3s0 down
    sudo wifi-menu
}

# added by travis gem
[ -f /home/jbyte/.travis/travis.sh ] && source /home/jbyte/.travis/travis.sh
