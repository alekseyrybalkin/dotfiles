#!/bin/sh

# make my keyboard fast
xset r rate 200 30

# turn off my touchpad if real mouse is present
cat /proc/bus/input/devices | grep -q Synaptics && {
  [ -d /dev/input/by-id ] && ls /dev/input/by-id | grep -q [Mm]ouse && {
    synclient TouchpadOff=1
  }
}

# set mouse pointer style for xmonad & ratpoison
xsetroot -cursor_name left_ptr
# set background for ratpoison
xsetroot -solid black
# now run ratpoison
exec /usr/bin/ratpoison
