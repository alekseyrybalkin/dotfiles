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

# c, c++, make flags
if [ `hostname` = "x220" ]; then
  export CFLAGS="-march=corei7-avx -O2 -pipe"
  export CXXFLAGS="${CFLAGS}"
  export MAKEFLAGS="-j5"
fi
if [ `hostname` = "alien" ]; then
  export CFLAGS="-march=core2 -O2 -pipe"
  export CXXFLAGS="${CFLAGS}"
  export MAKEFLAGS="-j3"
fi

if [ `hostname` = "x220" ]; then
  alias mplayer='mplayer -vo gl'
else
  alias mplayer='mplayer -vo xv:port=80'
fi
alias packer='packer --auronly'
alias ack='ack -a'
alias mark='echo -e "\E[31;41m\033[1m#################################################################################\033[0m"'
alias f='mark && ack -a'

if [ $TERM = "rxvt-256color" ]; then
  alias screen='screen -T rxvt-256color'
fi
# for tmux: export 256color
[ -n "$TMUX" ] && [ -n "$COLORTERM" ] && [ "$COLORTERM" = "rxvt-xpm" ] && export TERM=screen-256color && alias mc='TERM=xterm-256color mc'
[ -n "$TMUX" ] && [ -z "$COLORTERM" ] && alias mc='TERM=screen.rxvt mc'

if [ "$UID" -eq "0" ]; then
  PS1="\[\e[1;31m\]ROOT\[\e[0m\] \w # "
else
  PS1="\[\e[1;32m\]\h\[\e[0m\] \w $ "
fi

export EDITOR=/usr/bin/vim
export VIEWER=/usr/bin/vim
export LFS=/mnt/lfs
export LESS="-i -g -M -R -x4 -X -f -F -z-1"

complete -cf sudo

if [ -e ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi
echo $PATH | grep -q "$USER/bin" || {
  export PATH=/home/$USER/bin:"$PATH"
}

# load local untracked options
if [ -e ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

# disable xon/xoff flow control (^s/^q) in rxvt
stty -ixon

if [ -e ~/.py/bin/activate ]; then
  VIRTUAL_ENV_DISABLE_PROMPT=1 . ~/.py/bin/activate
fi
