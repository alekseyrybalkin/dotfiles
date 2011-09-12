#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset r rate 200 30 &
touchpad-autotoggle &
xsetroot -cursor_name left_ptr
# make win+left=home, win+right=end on work laptop
if [ `hostname` = "x220" ]; then
    xmodmap -e "keycode 173 = Home NoSymbol Home"
    xmodmap -e "keycode 171 = End NoSymbol End"
fi
exec xmonad
