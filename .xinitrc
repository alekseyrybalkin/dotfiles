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
exec ssh-agent xmonad
