#! /bin/bash

lock=" Lock"
restart="󰜉 Restart"
shutdown="⏻ Shutdown"

menu="$lock\n$restart\n$shutdown"

selected="$(echo -e "$menu" | wofi -i -p "What do you want to do?" --matching=fuzzy --dmenu)"

case $selected in
    $lock)
      swaylock
      ;;
    $restart)
      systemctl reboot
      ;;
    $shutdown)
      systemctl poweroff
      ;;
esac
