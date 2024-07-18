#! /bin/bash

# Choosing Options
a=~/media/backgrounds/$(ls ~/media/backgrounds | tofi --prompt 'Wallpaper')

options=$(echo $(echo -e $(wal --theme | grep -E "^[[:space:]]+-[[:space:]]" | grep -v -E "random|random_dark|random_light" | awk '{print $2}')"\nWallpaper") | sed 's/ /\n/g' | tofi --prompt "Colourscheme")

case $options in
  Wallpaper)
    wal -i $a
    cp $a ~/.cache/wallpaper
    ;;
  "")
    wal -i $a
    cp $a ~/.cache/wallpaper
    ;;
  *)
    wal --theme $options
    case $(echo -e "Yes\nNo" | tofi --prompt "Tint wallpaper?") in
      Yes)
        magick $a -fill "$(cat $HOME/.cache/wal/colors.json | jq '.colors.color14' | sed s/\"//g)" -tint 100 $HOME/.cache/wallpaper
        ;;
      *)
        cp $a ~/.cache/wallpaper
        ;;
    esac
    ;;
esac


# After pywal stuff
cp ~/.cache/wal/colors-tofi ~/.config/tofi/colors-tofi

killall .waybar-wrapped
nohup waybar > /dev/null &

hyprctl hyprpaper unload ~/.cache/wallpaper
sleep 0.1 # Hyprpaper gets stuck on this
hyprctl hyprpaper preload ~/.cache/wallpaper
sleep 0.1 # Hyprpaper gets stuck on this
hyprctl hyprpaper wallpaper HDMI-A-1,~/.cache/wallpaper
hyprctl hyprpaper wallpaper eDP-1,~/.cache/wallpaper

cp $HOME/.config/mako/config.default $HOME/.config/mako/config
. "${HOME}/.cache/wal/colors.sh"
declare -A colors
colors=(
    ["background-color"]="${background}"
    ["text-color"]="$foreground"
)
for color_name in "${!colors[@]}"; do
  sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" $HOME/.config/mako/config; done
makoctl reload
notify-send 'Wallpaper' 'Wallpaper has been changed' -i ~/.cache/wallpaper
