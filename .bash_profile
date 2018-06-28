# Copyright (c) 2010-2018 Aleksey Rybalkin
# SPDX-License-Identifier: GPL-3.0+

# One lang to rule them all
export LANG=en_US.UTF-8

# Ignore commands staring with space and duplicate commands
HISTCONTROL="ignoreboth"

# Load .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
