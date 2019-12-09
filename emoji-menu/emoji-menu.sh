#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
line=$(cat emoji-data | rofi -font "FiraCode Nerd Font 14" -show combi -width 100 -location 2 -lines 5 -no-sidebar-mode -dmenu -i -theme black)
if [ ! -z "$line" ]; then
    char=$(cut -f 1 -d',' <<< "$line")
    code=$(cut -f 2 -d',' <<< "$line")
    xdotool key "$code"
    if command -v xsel >/dev/null; then
        echo -n "$char" | xsel -i -p
        echo -n "$char" | xsel -i -b
    elif command -v xclip >/dev/null; then
        echo -n "$char" | xsel -i -sel prim
        echo -n "$char" | xsel -i -sel clip
    fi
fi
