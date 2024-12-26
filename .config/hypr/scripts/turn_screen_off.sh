#!/bin/bash
swayidle \
    timeout 1 'hyprctl dispatch dpms off' \
    resume 'hyprctl dispatch dpms on' & 
hyprlock
kill %%
