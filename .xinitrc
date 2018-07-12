# Copyright (c) 2010-2018 Aleksey Rybalkin
# SPDX-License-Identifier: GPL-3.0+

# load .Xresources
[[ -f ~/.config/xresources ]] && xrdb -merge ~/.config/xresources

# make my keyboard fast
xset r rate 200 30

# turn off my touchpad
xinput set-prop "Synaptics TM3075-002" "Device Enabled" 0

# allow other users use our X server
chmod 644 /run/rybalkin/public/xauthority

# remap insert into end for thinkpad x250
xmodmap -e "keycode 118 = End NoSymbol End"

# now run fluxbox
startfluxbox
