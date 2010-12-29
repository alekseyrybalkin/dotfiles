#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ `hostname` = "archeeepc" ]; then
    xbacklight -set 33 &
fi
xset r rate 200 30 &
xxkb &
exec dbus-launch ssh-agent openbox-session
