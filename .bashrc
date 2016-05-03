# Check for an interactive session
[ -z "${PS1}" ] && return

# bash history settings
export HISTSIZE=3000
export HISTFILESIZE=3000
export HISTFILE=~/.config/bash_history

# move cache folder into /tmp
export XDG_CACHE_HOME=/tmp/.${USER}-cache
export XDG_DATA_HOME=/tmp/.${USER}-data

# disable unnecessary history files
export LESSHISTFILE="-"

# use ~/.config for config files
export GNUPGHOME=~/.config/gnupg
export PSQLRC=~/.config/psqlrc
export GIMP2_DIRECTORY=.config/gimp
export INPUTRC=~/.config/inputrc
export FOSSIL_HOME=~/.config
alias mutt='mutt -F ~/.config/mutt/muttrc'
alias links='CONFIG_DIR=.config links'
alias tmux='tmux -f ~/.config/tmux.conf'

# disable gegl swap and pip cache
export GEGL_SWAP=RAM
alias pip='pip --no-cache-dir'

# c, c++, make flags
export CFLAGS="-march=x86-64 -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
export MAKEFLAGS="-j$((`nproc 2>/dev/null` + 1))"

# misc settings
export PATH=${HOME}/projects/bin:/usr/bin:/bin:/usr/bin/vendor_perl
export EDITOR=/usr/bin/vim
export VIEWER=/usr/bin/vim
export PAGER=/usr/bin/less
export LESS="-i -g -M -R -x4 -X -f -F -z-1"
export PYTHONDOCS=/usr/share/doc/python3/html
export PYTHONSTARTUP=~/.config/pythonstartup.py
complete -cf sudo

# misc aliases
alias cal='cal -m'
alias tpon='synclient TouchpadOff=0'
alias tpoff='synclient TouchpadOff=1'

# X settings
alias startx='startx -- -nolisten tcp -iglx'

# ack settings
ACK=ack
which ack-grep >/dev/null 2>&1 && {
  ACK=ack-grep
}
which ${ACK} >/dev/null 2>&1 && {
  alias mark='echo -e "\E[31;41m\033[1m###########################################################################\033[0m"'
  ack_version=`${ACK} --version | head -n 1 | sed "s/${ACK}\ //g" | sed "s/ack\ //g"`
  if [ "${ack_version:0:1}" -ge 2 ]; then
    alias f="mark && ${ACK}"
  else
    alias f="mark && ${ACK} -a"
  fi
}

# terminal settings
export TERMINFO=/usr/share/terminfo
if [ ${TERM} = "rxvt-256color" ]; then
  alias screen='screen -T rxvt-256color'
  export COLORTERM='rxvt'
fi
[ -n "${TMUX}" ] && [ -n "${COLORTERM}" ] && [[ ${COLORTERM} == *rxvt* ]] && export TERM=screen-256color && alias mc='TERM=xterm-256color mc'
[ -n "${TMUX}" ] && [ -z "${COLORTERM}" ] && alias mc='TERM=screen.rxvt mc'

# disable xon/xoff flow control (^s/^q) in rxvt
stty -ixon

# add more color to the terminal
export GCC_COLORS=1
alias grep='grep --color=auto'
if [ `uname` = "FreeBSD" ]; then
  alias ls='ls -G'
fi
if [ `uname` = "Linux" ]; then
  COREUTILS_VERSION=`ls --version | grep -m 1 "" | sed "s/ls (GNU coreutils) //g"`
  if [ ${COREUTILS_VERSION:0:1} -ge 6 ]; then
    alias ls='ls --color=auto --group-directories-first'
  else
    alias ls='ls --color=auto'
  fi
  eval `dircolors -b`
fi

# command prompt
case ${USER} in
  "rybalkin")
    PS1="\[\e[1;32m\]\h\[\e[0m\] \w $ "
    ;;
  "root")
    PS1="\[\e[1;31m\]ROOT\[\e[0m\] \w # "
    ;;
  *)
    PS1="\[\e[1;34m\]\h\[\e[0m\] \w $ "
    ;;
esac

# user- and hostname-specific settings
if [ "${USER}" == "rybalkin" ]; then
  export GPGKEY=5CA1EB8A
  export DEBFULLNAME='Aleksey Rybalkin'
  export DEBEMAIL='aleksey@rybalkin.org'

  export HEAVEN_DOMAIN='rybalkin.org'
  export HEAVEN_USER='aleksey'
  export HEAVEN=${HEAVEN_USER}@${HEAVEN_DOMAIN}
  if [ `hostname` == "sol" ] || [ `hostname` == "archiso" ]; then
    umask 077
  fi
fi

# load local untracked options
if [ -e ~/.config/bashrc.local ]; then
  source ~/.config/bashrc.local
fi
