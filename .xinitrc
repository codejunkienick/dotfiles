#!/bin/sh

xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
blueman-applet &
xscreensaver &
nm-applet &
pasystray &
telegram-desktop -startintray &
slack -u &
compton -b &
