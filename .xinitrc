#!/bin/sh

# make my keyboard fast
xset r rate 200 30

# turn off my touchpad
synclient TouchpadOff=1

# allow other users use our X server
# this is primaraly for gamer to launch wine
chmod 644 ~/.Xauthority

# now run fluxbox
startfluxbox
