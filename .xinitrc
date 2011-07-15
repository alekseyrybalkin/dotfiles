#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset r rate 200 30 &
xxkb &
dropboxd &
touchpad-autotoggle &
xsetroot -cursor_name left_ptr
# make win+left=home, win+right=end on work laptop
if [ `hostname` = "rybalkin-arch" ]; then
    xmodmap -e "keycode 133 = Mode_switch"
    xmodmap -e "keycode 113 = Left NoSymbol Home"
    xmodmap -e "keycode 114 = Right NoSymbol End"
fi
exec ssh-agent xmonad
