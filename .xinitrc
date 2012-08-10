#!/bin/sh

# source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# make my keyboard fast
xset r rate 200 30

# turn off my touchpad if real mouse is present
cat /proc/bus/input/devices | grep -q Synaptics
if [ $? -eq 0 ]; then
  [ -d /dev/input/by-id ] && ls /dev/input/by-id | grep -q [Mm]ouse
  if [ $? -gt 0 ]; then
    synclient TouchpadOff=0
  else
    synclient TouchpadOff=1
  fi
fi

# set mouse pointer style for xmonad
xsetroot -cursor_name left_ptr

# make win+left=home, win+right=end for ThinkPad X220
if [ `hostname` = "x220" ]; then
  xmodmap -e "keycode 173 = Home NoSymbol Home"
  xmodmap -e "keycode 171 = End NoSymbol End"
fi

# now run xmonad
exec xmonad
