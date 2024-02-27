#! /bin/bash

saving="    Saving"
performance="    Performance"

menu="$saving\n$performance"

selected="$(echo -e "$menu" | wofi -i -p "CPU Power mode" --matching=fuzzy --dmenu)"

case $selected in
    $saving)      
      kitty -e sudo cpupower frequency-set -g powersave && notify-send "Power mode changed" "Power mode changed to power savings."
      ;;
    $performance)
      kitty -e sudo cpupower frequency-set -g performance && notify-send "Power mode changed" "Power mode changed to performance."
      ;;
esac
