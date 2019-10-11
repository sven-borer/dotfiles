#!/bin/bash

dev=$(pactl info | grep -i sink | cut -d' ' -f 3)

while getopts 'idm' flag; do
  case "${flag}" in
    i) 
        pactl set-sink-volume $dev +5%
        killall dunst
        dunst &
        DISPLAY=:0 /usr/bin/notify-send -t 1000 -u low "AUDIO LEVEL" "$(awk -F"[][]" '/%/ { print $2 }' <(amixer sget Master) | head -1)"
        ;;
    d) 
        pactl set-sink-volume $dev -5%
        killall dunst
        dunst &
        DISPLAY=:0 /usr/bin/notify-send -t 1000 -u low "AUDIO LEVEL" "$(awk -F"[][]" '/%/ { print $2 }' <(amixer sget Master) | head -1)"
        ;;
    m)
        pactl set-sink-mute $dev toggle
        killall dunst
        dunst &
        RESULT=$([[ $(awk -F"[][]" '/%/ { print $4 }' <(amixer sget Master) | head -1) = "off" ]] && echo "Muted" || echo "Unmuted")
        DISPLAY=:0 /usr/bin/notify-send -t 1000 -u low "AUDIO LEVEL" "$RESULT"
    ;;
    *) exit 0 ;;
  esac
done
