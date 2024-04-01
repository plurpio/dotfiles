#! /bin/bash

saving="    Saving"
performance="    Performance"

menu="$saving\n$performance"

selected="$(echo -e "$menu" | tofi --prompt "Battery Mode")"

case $selected in
    $saving)      
      kitty -e doas cpupower frequency-set -g powersave && notify-send "Power mode changed" "Power mode changed to power savings."
      ;;
    $performance)
      kitty -e doas cpupower frequency-set -g performance && notify-send "Power mode changed" "Power mode changed to performance."
      ;;
esac
