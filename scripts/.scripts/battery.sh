#!/bin/sh
acpi -b | grep -v unavailable | awk -F'[,:%]' '{print $2, $3}' | {
    read -r status capacity

    if [ "$status" = Discharging -a "$capacity" -lt 10 ]; then
        logger "Critical battery threshold"
        DISPLAY=:0 dunstify -h string:x-dunst-stack-tag:battery -u critical " Low battery ($capacity%)!"
    fi
}
