# make my keyboard fast
xset r rate 200 30

# turn off my touchpad
synclient TouchpadOff=1

# allow other users use our X server
chmod 644 ~/.Xauthority

# set brightness
xbacklight -set 60

# remap insert into end for thinkpad x250
xmodmap -e "keycode 118 = End NoSymbol End"

# now run fluxbox
startfluxbox
