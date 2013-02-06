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

export GPGKEY=5CA1EB8A

# c, c++, make flags
export CFLAGS="-march=native -mno-avx -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
THREADS=`cat /proc/cpuinfo | grep "model name" | wc -l`
let THREADS=$THREADS+1
export MAKEFLAGS="-j${THREADS}"

alias mplayer='mplayer -ao sdl -vo gl'
alias mark='echo -e "\E[31;41m\033[1m#################################################################################\033[0m"'
alias f='mark && ack -a'
alias wine='LIBGL_DRIVERS_PATH=/usr/lib32/xorg/modules/dri WINEARCH=win32 wine'
alias startx='startx -- -nolisten tcp'

if [ $TERM = "rxvt-256color" ]; then
  alias screen='screen -T rxvt-256color'
fi
# for tmux: export 256color
[ -n "$TMUX" ] && [ -n "$COLORTERM" ] && [[ $COLORTERM == *rxvt* ]] && export TERM=screen-256color && alias mc='TERM=xterm-256color mc'
[ -n "$TMUX" ] && [ -z "$COLORTERM" ] && alias mc='TERM=screen.rxvt mc'

if [ "$UID" -eq "0" ]; then
  PS1="\[\e[1;31m\]ROOT\[\e[0m\] \w # "
else
  PS1="\[\e[1;32m\]\h\[\e[0m\] \w $ "
fi

export EDITOR=/usr/bin/vim
export VIEWER=/usr/bin/vim
export LESS="-i -g -M -R -x4 -X -f -F -z-1"
export LESSHISTFILE="-"
export TERMINFO=/usr/share/terminfo

complete -cf sudo

echo $PATH | grep -q "$USER/bin" || {
  export PATH=/home/$USER/bin:"$PATH"
}

# load local untracked options
if [ -e ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

# disable xon/xoff flow control (^s/^q) in rxvt
stty -ixon

# local (for the time being) things for ritchie
if [ `hostname` == "ritchie" ]; then
  if [ "$USER" == "rybalkin" ]; then
    export PATH="/home/$USER/bin:/sbin:/bin:/usr/sbin:/usr/bin"
    alias mpd-start="mpd /etc/mpd.conf"
    alias mpd-stop="mpd --kill /etc/mpd.conf"
    alias sshd-start="sudo /usr/sbin/sshd"
    alias sshd-stop="cat /run/sshd.pid | xargs sudo kill"
    umask 077
  fi
fi
