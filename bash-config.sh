echo -e "\033[01;32mWelcome to bash!\033[m"

export BASH_SILENCE_DEPRECATION_WARNING=1

function parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}
function current_dir() {
    echo ${PWD/*\//}
}
# export PS1="\[\e[96m\]\w \[\e[30;48;5;82m\]\$(parse_git_branch)\[\e[00m\]\n\[\e[32m\]➜ \[\e[m\]"
export PS1='\[\e[01;96m\]$(current_dir)\[\e[00m\] \[\e[30;48;5;82m\]$(parse_git_branch)\[\e[00m\]\n\[\e[32m\]➜ \[\e[m\]'

# Aliases
alias gc='git commit -v'
alias ga='git add'
alias gs='git status'
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias gitpull='git pull origin $(current_branch)'

# zsh alias
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'
alias md='mkdir -p'
alias rd=rmdir
alias run-help=man
alias which-command=whence



# history size unlimit
unset HISTSIZE 
unset HISTFILESIZE
shopt -s histappend

