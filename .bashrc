# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto --group-directories-first'
alias mplayer='mplayer -vo xv:port=80'
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
    PS1="[$bldred\u$txtrst $bldblue\W$txtrst]\$ "
else
    PS1="[$bldcyn\u$txtrst $bldblue\W$txtrst]\$ "
fi

if [ -z $EDITOR ]; then
    export PATH=/home/`whoami`/bin:$PATH
    export EDITOR=/usr/bin/vim
    export VIEWER=/usr/bin/vim
    export IDEA_JDK=/opt/java
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

# mount encrypted dropbox if not already
mount | grep "dbox type fuse.encfs" 1>/dev/null
if [ $? -gt 0 ]; then
    encfs --extpass=dboxpass ~/.encdbox/Dropbox ~/dbox &
fi
