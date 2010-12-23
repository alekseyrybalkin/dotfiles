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
    #exec dbus-launch ssh-agent startlxde
    exec dbus-launch ssh-agent openbox-session
elif [ `hostname` = "archdesktop" ]; then
    dropboxd &
    xsetroot -cursor_name left_ptr
    exec dbus-launch ssh-agent openbox-session
    #exec dbus-launch ssh-agent xmonad
elif [ `hostname` = "archeeepc" ]; then
    xbacklight -set 33 &
    xsetroot -cursor_name left_ptr
    exec dbus-launch ssh-agent xmonad
fi
