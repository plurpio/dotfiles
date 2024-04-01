#!/usr/bin/env bash

cp $HOME/.config/mako/config.default $HOME/.config/mako/config
. "${HOME}/.cache/wal/colors.sh"
declare -A colors
colors=(
    ["background-color"]="${background}"
    ["text-color"]="$foreground"
)
for color_name in "${!colors[@]}"; do
  sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" $HOME/.config/mako/config; done
makoctl reload
