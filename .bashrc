# Copyright (c) 2010-2018 Aleksey Rybalkin
# SPDX-License-Identifier: GPL-3.0+

# Check for an interactive session
[ -z "${PS1}" ] && return

# Load custom settings from /etc
[[ -f /etc/bash.custom.bashrc ]] && . /etc/bash.custom.bashrc
