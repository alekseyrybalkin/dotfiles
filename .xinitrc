#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset r rate 200 30 &
xxkb &
if [ `hostname` = "archdesktop" ]; then
    dropboxd &
fi
exec dbus-launch ssh-agent openbox-session
