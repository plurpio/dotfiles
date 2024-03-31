#! /bin/bash

cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print int(100 - $8) "%"}')
mem=$(free -m | awk 'NR==2{printf "%d%%\n", $3*100/$2}')
battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | tr -d ' ' | grep percentage | grep -o "[0-9]*")
clock=$(date +%I:%M)

echo "$cpu   $mem 󰧑  $battery%   $clock 󰥔 "
