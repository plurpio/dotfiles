#! /bin/bash

lock=" Lock"
restart="󰜉 Restart"
shutdown="⏻ Shutdown"

menu="$lock\n$restart\n$shutdown"

selected="$(echo -e "$menu" | tofi --prompt "Power")"

case $selected in
    $lock)      
    swaylock -f -e -S --grace 2 --fade-in 0.3 --effect-blur 25x25 --indicator --ring-color 9447ca --indicator-radius 100 --indicator-thickness 13 --effect-greyscale
      ;;
    $restart)
      systemctl reboot
      ;;
    $shutdown)
      systemctl poweroff
      ;;
esac
