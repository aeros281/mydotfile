#!/bin/bash

# Define your monitor you can get it by typing hyprctl monitor
MONITOR="eDP-1"


CURRENT_RATE=$(hyprctl monitors | grep "$MONITOR" -A 1 | grep -o '[0-9.]* at' | sed 's/ at//')

echo "Current rage is $CURRENT_RATE"


# Define your two refresh rates you want to toggle between
RATE1="120.00100"
RATE2="60.00100"


if [ "$(echo $CURRENT_RATE)" == "$(echo $RATE1)" ]; then
  hyprctl keyword monitor $MONITOR,2560x1600@$RATE2,auto,1.333333
  notify-send "Change refresh rate to 60hz"
else
  hyprctl keyword monitor $MONITOR,2560x1600@$RATE1,auto,1.333333
  notify-send "Change refresh rate to 120hz"
fi
