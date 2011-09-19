# Check for an interactive session
[ -z "$PS1" ] && return

# colored ls for FreeBSD
if [ `uname` = "FreeBSD" ]; then
    alias ls='ls -G'
fi
# colored ls for Linux
if [ `uname` = "Linux" ]; then

    COREUTILS_VERSION=`ls --version | grep -m 1 "" | sed "s/ls (GNU coreutils) //g"`
    if [ ${COREUTILS_VERSION:0:1} -ge 6 ]; then
        alias ls='ls --color=auto --group-directories-first'
    else
        alias ls='ls --color=auto'
    fi
    eval `dircolors -b`
fi

if [ `hostname` = "x220" ]; then
    alias mplayer='mplayer -vo gl'
else
    alias mplayer='mplayer -vo xv:port=80'
fi
alias packer='packer --auronly'
alias ack='ack -a'
alias essay='vim "+set tw=72"'

if [ $TERM = "rxvt-256color" ]; then
    alias screen='screen -T rxvt-256color'
fi

if [ "$UID" -eq "0" ]; then
    PS1="\[\e[1;31m\]ROOT\[\e[0m\]# "
else
    PS1="\[\e[1;32m\]\h\[\e[0m\] \w $ "
fi

if [ -z $EDITOR ]; then
    export PATH=/home/`whoami`/bin:$PATH
    export EDITOR=/usr/bin/vim
    export VIEWER=/usr/bin/vim
    export LFS=/mnt/lfs
fi

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

complete -cf sudo
