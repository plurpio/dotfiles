#!/bin/bash

prisminstances=$(ls $HOME/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances | grep -Ev '(instgroups\.json|\.LAUNCHER_TEMP)' | sed 's/^/Minecraft: /')
 
steamgames=$(for i in "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps"/*.acf; do echo "$(grep -E '^\s+"name"' "$i" | sed -E 's/^\s+"name"\s+"(.*)".*/\1/') ($(grep -E '^\s+"appid"' "$i" | sed -E 's/^\s+"appid"\s+"([0-9]+)".*/\1/'))"; echo; done)

games=$(echo -e "$steamgames\n$prisminstances\nGenshin Impact")

option=$(tofi --prompt "Game" <<< $games)

case $steamgames in
  *"$option"*)
      xdg-open steam://rungameid/$(echo "$option" | sed -n 's/.*(\([0-9]\+\)).*/\1/p')/dialog
      exit
      ;;
  "")
      exit
      ;;
esac

case $prisminstances in
  *"$option"*)
    org.prismlauncher.PrismLauncher -l "$(echo $option | sed "s/Minecraft: //")"
      exit
      ;;
  "")
      exit
      ;;
esac


case $option in
  *"Genshin Impact"*)
      an-anime-game-launcher --run-game
      exit
      ;;
  *)
    exit
    ;;
esac
