# Copyright (c) 2010-2019 Aleksey Rybalkin
# SPDX-License-Identifier: GPL-3.0+

# Check for an interactive session
[ -z "${PS1}" ] && return

# run all needed subprocesses first
NPROC=$((`nproc 2>/dev/null` + 1))
THIS_TTY=`tty`
USER=`whoami`

# disable xon/xoff flow control (^s/^q) in rxvt
stty -ixon

# colors
eval `dircolors -b`

# bash history settings
export HISTSIZE=5000
export HISTFILESIZE=5000

# disable unnecessary history files
export LESSHISTFILE="-"
export BZR_LOG=/dev/null

# use ~/.config for config files
export GNUPGHOME=~/.config/gnupg
export PSQLRC=~/.config/psqlrc
export INPUTRC=~/.config/inputrc
export FOSSIL_HOME=~/.config
export IPYTHONDIR=/tmp/.${USER}-ipython
export MPLCONFIGDIR=/tmp/.${USER}-matplotlib
alias mutt='mutt -F ~/.config/mutt/muttrc'
alias tmux='tmux -f ~/.config/tmux.conf'

# disable pip cache
alias pip='pip --no-cache-dir'

# c, c++, make flags
export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
export MAKEFLAGS="-j${NPROC}"

# misc settings
export PATH=/usr/bin:/usr/bin/vendor_perl:/bin:/sbin
export EDITOR=/usr/bin/vim
export VIEWER=/usr/bin/vim
export PAGER=/usr/bin/less
export LESS="-i -g -M -R -x4 -X -f -F -z-1"
export PYTHONDOCS=file:///usr/share/doc/python/html/library
export PYTHONSTARTUP=~/.config/pythonstartup.py
export GPG_TTY=${THIS_TTY}

# misc aliases
alias cal='cal -m'
alias tpon="xinput set-prop '${TOUCHPAD_DEVICE}' 'Device Enabled' 1"
alias tpoff="xinput set-prop '${TOUCHPAD_DEVICE}' 'Device Enabled' 0"
alias diff='diff --color'
alias pep8='pycodestyle --first --show-source --ignore=E501'
alias pep8all='find . -name "*.py" | xargs pycodestyle --first --show-source --ignore=E501'
alias essay='vim "+set tw=72"'
alias xclip='xclip -selection clipboard'
alias xoff='xset dpms force off'
alias slashr='sed -i "s/\r//g"'
alias python='python -q'
alias ipython='ipython --no-confirm-exit'

# X settings
export DISPLAY=:0.0
export XAUTHORITY=/run/rybalkin/public/xauthority
alias startx='startx -- -nolisten tcp -iglx'

# ack settings
ACK=ack
type ack-grep >/dev/null 2>&1 && {
    ACK=ack-grep
}
type ${ACK} >/dev/null 2>&1 && {
    alias mark='echo -e "\E[31;41m\033[1m###########################################################################\033[0m"'
    alias f="mark && ${ACK} --ignore-dir=.data"
}

# terminal settings
export TERMINFO=/usr/share/terminfo
if [ ${TERM} = "xterm-kitty" ] || [ ${TERM} = "rxvt-256color" ]; then
    alias screen='screen -T rxvt-256color'
    export COLORTERM='rxvt'
fi
[ -n "${TMUX}" ] && [ -n "${COLORTERM}" ] && [[ ${COLORTERM} == *rxvt* ]] && export TERM=screen-256color && alias mc='TERM=xterm-256color mc'
[ -n "${TMUX}" ] && [ -z "${COLORTERM}" ] && alias mc='TERM=screen.rxvt mc'

# add more color to the terminal
export GCC_COLORS=1
alias grep='grep --color=auto'
alias ls='ls --color=auto --group-directories-first'

# command prompt
case "${USER}" in
    "rybalkin")
        # https://unix.stackexchange.com/a/124409
        PS1="\[\033[38;5;39m\]\h\[\033[0m\] \w $ "
        ;;
    "root")
        PS1="\[\e[1;31m\]\h\[\e[0m\] \w # "
        ;;
    *)
        PS1="\[\033[38;5;208m\]\h\[\033[0m\] \w $ "
        ;;
esac

# http proxy
if [ "${USER}@$(hostname)" == "rybalkin@x250" ]; then
    export http_proxy=http://127.0.0.1:8118
    export HTTP_PROXY=${http_proxy}
    export https_proxy=${http_proxy}
    export HTTPS_PROXY=${http_proxy}
fi

# Load custom settings from /etc
[[ -f /etc/bash.custom.bashrc ]] && . /etc/bash.custom.bashrc

# Load custom settings from home folder
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local
