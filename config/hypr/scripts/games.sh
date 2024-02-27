#!/bin/bash

prisminstances=$(ls $HOME/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances)
 
steamgames=$(for i in "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps"/*.acf; do echo "$(grep -E '^\s+"name"' "$i" | sed -E 's/^\s+"name"\s+"(.*)".*/\1/') ($(grep -E '^\s+"appid"' "$i" | sed -E 's/^\s+"appid"\s+"([0-9]+)".*/\1/'))"; echo; done)

games=$(echo -e "$steamgames\n$prisminstances")

option=$(tofi --prompt "What game do you want to play?" <<< $games)

case $steamgames in
  *"$option"*)
      xdg-open steam://run/$(echo "$option" | sed -n 's/.*(\([0-9]\+\)).*/\1/p')
      exit
      ;;
  "")
      exit
      ;;
esac

case $prisminstances in
  *"$option"*)
      org.prismlauncher.PrismLauncher -l $option
      exit
      ;;
  "")
      exit
      ;;
esac
