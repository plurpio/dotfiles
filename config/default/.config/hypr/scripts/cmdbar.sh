#! /bin/bash

function prompt() {
  case $(echo -e "Yes\nNo" | tofi --prompt "Action") in 
    Yes)
      $($@);; esac
}

SCRIPTDIR=~/.config/hypr/scripts

option=$(echo -e "Wallpaper\n"\
"Run\n"\
"Volume\n"\
"Bookmarks\n"\
"VMs\n"\
"Battery\n"\
"PWAify\n"\
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
    prompt systemctl reboot;;
  Shutdown)
    prompt systemctl poweroff;;
  Volume)
    sh $SCRIPTDIR/volume.sh;;
  Wallpaper)
    sh $SCRIPTDIR/wallpaper.sh;;
  Bookmarks)
    sh $SCRIPTDIR/bookmarks.sh;;
  VMs)
    sh $SCRIPTDIR/virt.sh;;
  PWAify)
    chromium --app=https://$(echo "" | tofi --prompt "website" --require-match=False);;
  Battery)
    sh $SCRIPTDIR/battery.sh;;
  Run)
    A=$(echo "" | tofi --prompt "Run" --require-match=False); B="$($A 2>&1)" || notify-send "command failed" "$B";;
  Theme)
    ametrine change $(ametrine theme ls | tofi --prompt "Theme");;
  Update)
    kitty -e sh $SCRIPTDIR/update.sh;;
  Brightness)
    sh $SCRIPTDIR/brightness.sh;;
  Games)
    sh $SCRIPTDIR/games.sh;;
  Lock)
    prompt hyprlock;;
 "")
    exit;;
esac
