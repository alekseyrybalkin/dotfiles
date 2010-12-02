# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto --group-directories-first'
alias mplayer='mplayer -vo xv:port=80'
#alias mplayer2='mplayer -vo xv:port=80 -vf pp=lb'
if [ `hostname` = "archwork" ]; then
    alias packer='packer --auronly --ignore ireport-nb'
else
    alias packer='packer --auronly'
fi

eval `dircolors -b`
PS1='\[\e[1;36m\]\u\e[1;31m\] [->\[\e[m\]\[\e[1;37m\]\w\[\e[m\]\[\e[m\]\[\e[1;31m\]<-]\[\e[m\] '

if [ -z $EDITOR ]; then
    export PATH=/home/aleksey/bin:/home/aleksey/dropbox/bin:$PATH
    export EDITOR=/usr/bin/vim
    export VIEWER=/usr/bin/vim
    export IDEA_JDK=/opt/java
fi

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

complete -cf sudo
