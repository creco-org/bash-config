#!/usr/bin/env bash
echo -e "\033[01;32mWelcome to bash!\033[m"

export BASH_SILENCE_DEPRECATION_WARNING=1

function parse_git_branch() {
  #     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}
function current_dir() {
  echo ${PWD/*\//}
}
export -f parse_git_branch
export -f current_dir
# export PS1="\[\e[96m\]\w \[\e[30;48;5;82m\]\$(parse_git_branch)\[\e[00m\]\n\[\e[32m\]➜ \[\e[m\]"
# export PS1='\[\e[01;96m\]$(current_dir)\[\e[00m\] \[\e[30;48;5;82m\]$(parse_git_branch)\[\e[00m\]\n\[\e[32m\]➜ \[\e[m\]'
export PS1='\[\e[01;96m\]$(current_dir)\[\e[00m\] \[\e[30;48;5;82m\]$(parse_git_branch)\[\e[00m\] \D{%H:%M:%S}\n\[\e[32m\]➜ \[\e[m\]'

# Aliases
alias gc='git commit -v'
alias ga='git add'
alias gs='git status'
function current_branch() {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias gitpull='git pull origin $(current_branch)'

# zsh alias
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'
alias md='mkdir -p'
alias bs='/usr/local/bin/bash'
alias cl='curl -L'
alias vi='vim'
alias v='vim'
alias re='exec bash'
alias wrun='wrun(){ wget -q -O - $1 | bash;}; wrun'
alias rd=rmdir
alias run-help=man
alias which-command=whence
# alias docker=nerdctl
# alias docker="lima nerdctl"
alias gwc='git diff HEAD --shortstat'
alias grep="rg"
alias g="git"

# https://stackoverflow.com/questions/9457233/unlimited-bash-history#answer-19533853
# history size unlimit
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "

export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# unset HISTSIZE
# unset HISTFILESIZE
# shopt -s histappend

# auto complete

if [[ $- == *i* ]]; then
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi

# color setting
export LSCOLORS=ExFxCxDxBxegedabagacad

eval "$(direnv hook bash)" 2>/dev/null
