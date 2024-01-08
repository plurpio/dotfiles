#! /bin/bash

a=~/media/backgrounds/$(ls ~/media/backgrounds | tofi --prompt 'What wallpaper do you want to use?')
wal -i $a

cp $a ~/.cache/wallpaper
cp ~/.cache/wal/colors-tofi ~/.config/tofi/colors-tofi
cp ~/.cache/wal/colors.scss ~/.config/eww/colors.scss

hyprctl --batch hyprpaper unload ~/.cache/wallpaper; hyprctl hyprpaper preload ~/.cache/wallpaper; hyprctl hyprpaper wallpaper HDMI-A-1,~/.cache/wallpaper; hyprctl hyprpaper wallpaper eDP-1,~/.cache/wallpaper

killall waybar
notify-send 'Wallpaper' 'Wallpaper and colourscheme changed' -i ~/.cache/wallpaper
nohup waybar > /dev/null &
;;
BatteryMode)
selected="$(echo -e "    Saving\n    Performance" | tofi --prompt "CPU Power mode")"

case $selected in
    $saving)      
      kitty -e sudo cpupower frequency-set -g powersave && notify-send "Power mode changed" "Power mode changed to power savings."
      ;;
    $performance)
      kitty -e sudo cpupower frequency-set -g performance && notify-send "Power mode changed" "Power mode changed to performance."
      ;;
esac

