a=~/media/backgrounds/$(ls ~/media/backgrounds | tofi --prompt 'What wallpaper do you want to use?')
cp $a ~/.cache/wallpaper
cp $a ~/.config/tofi/colors-tofi
cp $a ~/.config/eww/colors.scss

hyprctl hyprpaper unload ~/.cache/wallpaper
hyprctl hyprpaper preload ~/.cache/wallpaper
hyprctl hyprpaper wallpaper HDMI-A-1,~/.cache/wallpaper
hyprctl hyprpaper wallpaper eDP-1,~/.cache/wallpaper

killall waybar && wal -i $a
notify-send 'Wallpaper' 'Wallpaper and colourscheme changed' -i ~/.cache/wallpaper
nohup waybar > /dev/null &
