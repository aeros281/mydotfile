#!/bin/bash
WINDOW=$(hyprctl clients | grep "class: " | awk '{gsub("class: ", ""); if ($1 != "") print}' | sort -u | wofi --show dmenu -i)
if [ "$WINDOW" = "" ]; then
    exit
fi
hyprctl dispatch focuswindow $WINDOW
