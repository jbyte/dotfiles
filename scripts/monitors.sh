#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/jbyte/.Xauthority

cardPath=/sys$(udevadm info -q path /dev/dri/card0)

conHdmi=$(xrandr | sed -n '/HDMI1 connected/p')
shaHdmi=$(sha1sum $cardPath/card0-HDMI-A-1/edid | cut -f1 -d " ")
if [ -n "$conHdmi" ]; then
    xrandr --output eDP1 --auto --output HDMI1 --auto --primary --left-of eDP1
else
    xrandr --output eDP1 --auto --primary --output HDMI1 --off
fi

