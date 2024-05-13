#!/usr/bin/env bash

hyprpaper &
nm-applet --indicator &
blueman-applet &
waybar &
dunst &
hyprctl dispatch workspace 1 &
wl-paste --type text --watch cliphist store & #Stores only text data
wl-paste --type image --watch cliphist store #Stores only image data
