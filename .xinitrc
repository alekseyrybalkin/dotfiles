# make my keyboard fast
xset r rate 200 30

# turn off my touchpad
synclient TouchpadOff=1

# allow other users use our X server
chmod 644 ~/.Xauthority

# set brightness
xbacklight -set 70

# now run fluxbox
startfluxbox
