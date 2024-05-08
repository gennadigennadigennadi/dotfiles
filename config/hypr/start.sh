#!/usr/bin/env bash

hyprpaper &
nm-applet --indicator &
blueman-applet &
waybar &
dunst &
hyprctl dispatch workspace 1
