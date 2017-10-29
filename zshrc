### EXPORTS
export TERM="xterm-256color"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export ANDROID_HOME=/opt/android-sdk
export DISPLAY=:0
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export RUST_SRC_PATH=/usr/src/rust/src:~/project/browser/src
export BROWSER=/usr/bin/firefox
# add lavarel exe to path
# TODO: find better place to have this
export PATH=$PATH:~/.config/composer/vendor/bin/

# add ruby/travis cli to path
export PATH=$PATH:~/.gem/ruby/2.3.0/bin/

# add racer to path
export PATH=$PATH:~/.cargo/bin/

# varable for spo svn server
export SPO=svn://lalgec.fri.uni-lj.si/s63110350

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 2
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

# openconnect
alias oc="sudo openconnect --csd-user=jbyte --csd-wrapper=/home/jbyte/.cisco/csd-wrapper.sh"

# steam
alias steam="optirun wine ~/PlayOnLinux's virtual drives/skyrim/drive_c/Program\ Files/Steam/Steam.exe"

# vim
alias vi="nvim"

# tor-browser
alias tor-browser="cd ~/Downloads/tor-browser_en-US/; ./start-tor-browser.desktop; cd -;"

# emacs
alias em="emacsclient -c"

# clear
alias clr="clear"

# aur
aur() {
    git clone "https://aur.archlinux.org/$1" ~/oth/aur/"$1";
}
aur-search() {
    ~/aur-search.py "$1";
}

# listing
alias ls="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -a"
alias lla="ls --color -alh"

# editing/sourcing this file
alias ez="nvim ~/.zshrc"
alias sz="source ~/.zshrc"

# git aliases
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gdt="git difftool"
alias gf="git fetch"
alias gm="git merge"
alias gmt="git mergetool"
alias gps="git push"
alias gpl="git pull"

# aliases for spo sic
SICPATH=~/projects/spo/SicTools
alias sictools="java -jar $SICPATH/out/make/sictools.jar"
alias sicasm="java -cp $SICPATH/out/make/sictools.jar sic.Asm"
alias siclink="java -cp $SICPATH/out/make/sictools.jar linked.obj"

# aliases for work
alias work="~/.work/work.sh"
alias hudlajf="ssh pi@git.hudlajf.com"
alias prod="ssh root@server.hudlajf.com"


#. /oth/powerline/powerline/powerline/bindings/zsh/powerline.zsh

POWERLEVEL9K_MODE='awesome-fontconfig'

source ~/.powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs virtualenv)

POWERLEVEL9K_SHOW_CHANGESET=true

connect-wifi(){
    sudo ip link set wlp3s0 down
    sudo wifi-menu
}

# added by travis gem
[ -f /home/jbyte/.travis/travis.sh ] && source /home/jbyte/.travis/travis.sh

# load source for fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
