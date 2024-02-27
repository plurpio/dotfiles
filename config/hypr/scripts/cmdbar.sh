#! /bin/bash

SCRIPTDIR=$XDG_CONFIG_DIR/hypr/scripts

option=$(echo -e "Wallpaper\n"\
"Volume\n"\
"VMs\n"\
"Power\n"\
"Lock\n"\
"Battery\n"\
"Update\n"\
"Theme" | tofi --prompt "What would you like to do?")

echo "==="$option"===="

case $option in
  Volume)
    echo "some action"
    ;;
  Wallpaper)
    sh $SCRIPTDIR/wallpaper.sh
    ;;
  VMs)
    sh $SCRIPTDIR/virt.sh
    ;;
  Power)
    sh $SCRIPTDIR/power.sh
    ;;
  Battery)
    sh $SCRIPTDIR/battery.sh
    ;;
  Update)
    sh $SCRIPTDIR/update.sh
    ;;
  Lock)
    swaylock -f -e -S --grace 2 --fade-in 0.3 --effect-blur 25x25 --indicator --ring-color 9447ca --indicator-radius 100 --indicator-thickness 13 --effect-greyscale
    ;;
   Theme)
    theme=$(/bin/ls $HOME/.config/hypr/themes | tofi --prompt "What theme do you want?") && [ -n "$theme" ] && for file in "$HOME/.config/hypr/themes"/*; do sed -i "s|$(basename "$file")|$theme|g" $HOME/.config/hypr/hyprland.conf; done && notify-send "Theme" "Theme was changed to $theme."
    ;;
 "")
    exit
    ;;
esac
