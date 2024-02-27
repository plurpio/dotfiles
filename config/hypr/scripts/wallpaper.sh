#! /bin/bash

# Choosing Options
a=~/media/backgrounds/$(ls ~/media/backgrounds | tofi --prompt 'What wallpaper do you want to use?')

options=$(echo $(echo -e $(wal --theme | grep -E "^[[:space:]]+-[[:space:]]" | grep -v -E "random|random_dark|random_light" | awk '{print $2}')"\nWallpaper") | sed 's/ /\n/g' | tofi --prompt "What colourscheme do you want?")

case $options in
  Wallpaper)
    wal -i $a
    ;;
  "")
    wal -i $a
    ;;
  *)
    wal --theme $options
    ;;
esac


# After pywal stuff
cp $a ~/.cache/wallpaper
cp ~/.cache/wal/colors-tofi ~/.config/tofi/colors-tofi

if pgrep -x "waybar" > /dev/null
then
  killall waybar
  nohup waybar > /dev/null &
else
    cp ~/.cache/wal/colors.scss ~/.config/eww/colors.scss
fi


hyprctl hyprpaper unload ~/.cache/wallpaper
sleep 0.1 # Hyprpaper gets stuck on this
hyprctl hyprpaper preload ~/.cache/wallpaper
sleep 0.1 # Hyprpaper gets stuck on this
hyprctl hyprpaper wallpaper HDMI-A-1,~/.cache/wallpaper
hyprctl hyprpaper wallpaper eDP-1,~/.cache/wallpaper

notify-send 'Wallpaper' 'Wallpaper and colourscheme changed' -i ~/.cache/wallpaper
