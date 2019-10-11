#!/bin/bash
BATTINFO=$(acpi -b)
DISCHARGING=$(echo "$BATTINFO" | grep Discharging)
BATTERYLEVEL=$(echo "$BATTINFO" | cut -d " " -f 4 | sed 's/%,//')
WARNING=20
TIMEOUT=5000
[[ $DISCHARGING && $BATTERYLEVEL -lt $WARNING ]] && DISPLAY=:0 /usr/bin/notify-send -t $TIMEOUT -u low "BATTERY LOW" "$BATTINFO" || exit 0
