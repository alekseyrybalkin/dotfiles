# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto --group-directories-first'
if [ `hostname` = "rybalkin-arch" ]; then
    alias mplayer='mplayer -vo gl'
else
    alias mplayer='mplayer -vo xv:port=80'
fi
alias packer='packer --auronly'
alias essay='vim "+set tw=72"'

if [ $TERM = "rxvt-256color" ]; then
    alias screen='screen -T rxvt-256color'
fi

eval `dircolors -b`

bldred='\[\e[1;31m\]'  # Red
bldblue='\[\e[1;34m\]' # Blue
bldcyn='\[\e[1;36m\]'  # Cyan
txtrst='\[\e[0m\]'     # Text Reset

if [ "$UID" -eq "0" ]; then
    PS1="[$bldred\u$txtrst $bldblue\w$txtrst]\$ "
else
    PS1="[$bldcyn\u$txtrst $bldblue\w$txtrst]\$ "
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
