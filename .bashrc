# Check for an interactive session
[ -z "${PS1}" ] && return

export HISTFILESIZE=10000

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
alias grep='grep --color=auto'
alias cal='cal -m'

# c, c++, make flags
export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
if [ -e /proc/cpuinfo ]; then
  THREADS=`cat /proc/cpuinfo | grep "model name" | wc -l`
  let THREADS=$THREADS+1
  export MAKEFLAGS="-j${THREADS}"
fi

alias mplayer='mplayer -ao sdl -vo gl'
which ack >/dev/null 2>&1 && {
  alias mark='echo -e "\E[31;41m\033[1m###########################################################################\033[0m"'
  ack_version=`ack --version | head -n 1 | sed 's/ack\ //g'`
  if [ "${ack_version:0:1}" -ge 2 ]; then
    alias f='mark && ack'
  else
    alias f='mark && ack -a'
  fi
}
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
export PAGER=/usr/bin/less
export LESS="-i -g -M -R -x4 -X -f -F -z-1"
export LESSHISTFILE="-"
export TERMINFO=/usr/share/terminfo

complete -cf sudo

echo $PATH | grep -q "$USER/bin" || {
  export PATH=/home/$USER/bin:"$PATH"
}

# disable xon/xoff flow control (^s/^q) in rxvt
stty -ixon

if [ `hostname` == "ritchie" ] || [ `hostname` == "snowden" ] ||\
   [ `hostname` == "archiso" ]; then
  if [ "$USER" == "rybalkin" ]; then
    if [ `hostname` == "snowden" ]; then
      export PATH="/home/$USER/bin:/usr/bin:/opt/maven/bin:/opt/ant/bin:/opt/jdk/bin:/opt/jdk/jre/bin"
      export ANT_HOME=/opt/ant
      export J2SDKDIR=/opt/jdk
      export J2REDIR=/opt/jdk/jre
      export JAVA_HOME=/opt/jdk
      export M2_HOME=/opt/maven
      export MAVEN_OPTS=-Xmx512m
      alias java="java -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
      alias javaws="_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true' javaws"
    else
      export PATH="/home/$USER/bin:/usr/bin"
    fi
    alias mpd-start="mpd /etc/mpd.conf"
    alias mpd-stop="mpd --kill /etc/mpd.conf"
    alias sshd-start="sudo /usr/bin/sshd"
    alias sshd-stop="cat /run/sshd.pid | xargs sudo kill"
    umask 077
  fi
fi
if [ "$USER" != "rybalkin" ]; then
  if [ "$USER" != "root" ]; then
    PS1="\[\e[1;34m\]\h\[\e[0m\] \w $ "
    export DISPLAY=:0.0
    export XAUTHORITY=/home/rybalkin/.Xauthority
  fi
fi
alias wine='LIBGL_DRIVERS_PATH=/usr/lib32/xorg/modules/dri WINEARCH=win32 wine'
export SDL_AUDIODRIVER="alsa"

export GPGKEY=5CA1EB8A
export DEBFULLNAME='Aleksey Rybalkin'
export DEBEMAIL='aleksey@rybalkin.org'

export HEAVEN_DOMAIN='rybalkin.org'
export HEAVEN_USER='aleksey'
export HEAVEN=${HEAVEN_USER}@${HEAVEN_DOMAIN}

# load local untracked options
if [ -e ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
