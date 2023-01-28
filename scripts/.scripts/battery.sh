#!/bin/sh
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
    read -r status capacity

    if [ "$status" = Discharging -a "$capacity" -lt 10 ]; then
        logger "Critical battery threshold"
        DISPLAY=:0 /usr/bin/notify-send -u critical "Battery low ($capacity%)!"
    fi
}
