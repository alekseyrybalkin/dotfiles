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

black='\e[0;30m'        # Black - Regular
red='\e[0;31m'          # Red
green='\e[0;32m'        # Green
yellow='\e[0;33m'       # Yellow
blue='\e[0;34m'         # Blue
purple='\e[0;35m'       # Purple
cyan='\e[0;36m'         # Cyan
white='\e[0;37m'        # White

bldblack='\e[1;30m'     # Black - Bold
bldred='\e[1;31m'       # Red
bldgreen='\e[1;32m'     # Green
bldyellow='\e[1;33m'    # Yellow
bldblue='\e[1;34m'      # Blue
bldpurple='\e[1;35m'    # Purple
bldcyan='\e[1;36m'      # Cyan
bldwhite='\e[1;37m'     # White

txtrst='\[\e[0m\]'      # Text Reset

color_user() {
    [ "$UID" -eq 0 ] && echo "$bldred\u$txtrst" || echo "$bldgreen\u$txtrst"
}
color_host() {
    [ -n "$SSH_CONNECTION" ] && echo "@$bldyellow\h$txtrst" || echo ""
}
prompt() {
    [ "$UID" -eq 0 ] && echo "#" || echo "$"
}
export PS1="[$(color_user)$(color_host) $bldblue\w$txtrst]$(prompt) "

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
