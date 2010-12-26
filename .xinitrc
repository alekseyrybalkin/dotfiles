#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#xrandr --output LVDS1 --off --output VGA1 --mode 1024x768

xset r rate 200 30 &
if [ `hostname` = "archwork" ]; then
    dropboxd &
    xxkb &
elif [ `hostname` = "archdesktop" ]; then
    dropboxd &
elif [ `hostname` = "archeeepc" ]; then
    xbacklight -set 33 &
fi
exec dbus-launch ssh-agent openbox-session
