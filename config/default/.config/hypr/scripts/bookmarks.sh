#! /bin/bash
if [ ! -f "$HOME/.cache/bookmarks.txt" ]; then
  touch $HOME/.cache/bookmarks.txt
fi

bookmarks=$(\cat $HOME/.cache/bookmarks.txt)


options="$bookmarks
Add
Remove"

option=$(tofi --prompt "Bookmarks" <<< $options)

case $option in
  Add)
    echo $(wl-paste) >> $HOME/.cache/bookmarks.txt
    ;;
  Remove)
    remove=$(tofi --prompt 'Remove' <<< $bookmarks)
    grep -v "$remove" file > $HOME/.cache/bookmarks.txt
    ;;
  "")
    exit
    ;;
  *)
    if [[ "$option" == http* ]]; then
        xdg-open $option
    else
        wl-copy $option
    fi
    ;;
esac
