#!/bin/bash


### ALIASES
alias ls="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -a"
alias lla="ls --color -alh"

alias eb="vim ~/.bashrc"
alias sb="source ~/.bashrc"

alias pg_start="/c/Program\ FIles/postgreSQL/9.5/bin/pg_ctl.exe start -D /c/Program\ Files/postgreSQL/9.5/data"

### GIT PROMPT CONFIGS

# Set config variables first
#GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
#source ~/.bash-git-prompt/gitprompt.sh

### COLOR DEFINITIONS
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_MAGENTA="\033[0;35m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
#COLOR_DARK_GREEN="\033[38;5;70m"


### GIT PROMPT FUNCTIONS
function git_color {
    local git_status="$(git status 2>/dev/null)"

    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $COLOR_YELLOW
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN
    else
        echo $COLOR_OCHRE
    fi
}

function git_branch {
    local git_status="$(git status 2>/dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo "($branch)"
    elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo "($commit)"
    fi
}

### THE PS1 DECLARATION
PS1="\[$COLOR_GREEN\]\n[\u@\h]"
PS1+="\[$COLOR_MAGENTA\]\w"
PS1+="\[\$(git_color)\]"
PS1+="\$(git_branch) "
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "

export PS1
