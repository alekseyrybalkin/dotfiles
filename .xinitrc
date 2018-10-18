# Copyright (c) 2010-2018 Aleksey Rybalkin
# SPDX-License-Identifier: GPL-3.0+

# load .Xresources
[[ -f ~/.config/xresources.$(hostname) ]] && xrdb -merge ~/.config/xresources.$(hostname)

# make my keyboard fast
xset r rate 200 30

# turn off my touchpad
xinput set-prop "${TOUCHPAD_DEVICE}" "Device Enabled" 0

# allow other users use our X server
chmod 644 /run/rybalkin/public/xauthority

# remap insert into end for thinkpad x250
xmodmap -e "keycode 118 = End NoSymbol End"

# move mouse to the lower-right corner of the screen
xdotool mousemove 1304 740

# now run fluxbox
startfluxbox
