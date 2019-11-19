#!/bin/bash
FREEMEMORY=$(free | grep Mem | awk '{print int($7/$2 * 100.0)}')
WARNING=10
TIMEOUT=5000
[[ $FREEMEMORY -lt $WARNING ]] && DISPLAY=:0 /usr/bin/notify-send -t $TIMEOUT -u normal "HIGH MEMORY USAGE" "MEMORY FREE: $FREEMEMORY%" || exit 0
