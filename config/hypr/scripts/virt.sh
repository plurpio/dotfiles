#! /bin/bash

choice=$(echo -e "Add\n$(virsh list --all --name)" | tofi --prompt="Virtual Machine")

case "$choice" in
  Add)
    kitty -e ~/.config/hypr/scripts/virtAdd.sh
    remote-viewer spice://127.0.0.1:5900 -f
    ;;
  "")
    exit
    ;;
  *)
    virsh -q start $choice
    remote-viewer spice://127.0.0.1:5900 -f
    ;;
esac
