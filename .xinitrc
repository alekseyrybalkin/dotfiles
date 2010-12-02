#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

#xbacklight -set 33 &
dropboxd &
xxkb &
xset r rate 200 30 &
#exec wmii
exec ck-launch-session dbus-launch ssh-agent startlxde
#xsetroot -cursor_name left_ptr
#xrandr --output LVDS1 --off --output VGA1 --mode 1024x768
#exec ck-launch-session dbus-launch xmonad
