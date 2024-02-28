#! /bin/bash

function prompt() {
  case $(echo -e "Yes\nNo" | tofi --prompt "Action") in 
    Yes)
      $($@);; esac
}

SCRIPTDIR=~/.config/hypr/scripts

option=$(echo -e "Wallpaper\n"\
"Volume\n"\
"VMs\n"\
"Battery\n"\
"Update\n"\
"Games\n"\
"Brightness\n"\
"Theme\n"\
"Lock\n"\
"Logout\n"\
"Suspend\n"\
"Restart\n"\
"Shutdown\n" | tofi --prompt "What would you like to do?")

case $option in
  Logout)
    prompt pkill -u $USER;;
  Suspend)
    prompt systemctl suspend;;
  Restart)
    prompt systemctl restart;;
  Shutdown)
    prompt systemctl shutdown;;
  Volume)
    sh $SCRIPTDIR/volume.sh;;
  Wallpaper)
    sh $SCRIPTDIR/wallpaper.sh;;
  VMs)
    sh $SCRIPTDIR/virt.sh;;
  Battery)
    sh $SCRIPTDIR/battery.sh;;
  Update)
    kitty -e sh $SCRIPTDIR/update.sh;;
  Brightness)
    sh $SCRIPTDIR/brightness.sh;;
  Games)
    sh $SCRIPTDIR/games.sh;;
  Lock)
    prompt swaylock -f -e --image ~/.cache/wallpaper --grace 2 --fade-in 0.3 --indicator --ring-color 9447ca --indicator-radius 100 --indicator-thickness 25 --effect-vignette 0.7:0.7 --effect-pixelate 20;;
   Theme)
    theme=$(/bin/ls $HOME/.config/hypr/themes | tofi --prompt "What theme do you want?") && [ -n "$theme" ] && for file in "$HOME/.config/hypr/themes"/*; do sed -i "s|$(basename "$file")|$theme|g" $HOME/.config/hypr/hyprland.conf; done && notify-send "Theme" "Theme was changed to $theme.";;
 "")
    exit;;
esac
