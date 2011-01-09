#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset r rate 200 30 &
xxkb &
exec dbus-launch ssh-agent openbox-session
