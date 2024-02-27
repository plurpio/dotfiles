#! /bin/bash

bg=$(ls ~/media/backgrounds | wofi -i --dmenu)

killall waybar
wal -i ~/media/backgrounds/$bg
nohup waybar > /dev/null &
swww img -t grow ~/media/backgrounds/$bg &
notify-send "Wallpaper" "Changed wallpaper to $bg" -i ~/media/backgrounds/$bg
