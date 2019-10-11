#!/bin/sh -e
SCREENSHOT=/tmp/screen_locked.png

FIRST='#a6e22eff'
SECOND='#383830ff'

scrot $SCREENSHOT
mogrify -scale 5% -scale 2000% $SCREENSHOT
i3lock -i $SCREENSHOT --insidevercolor=$FIRST --ringvercolor=$FIRST --insidewrongcolor=$FIRST --ringwrongcolor=$FIRST --insidecolor=$FIRST --ringcolor=$FIRST --linecolor=$FIRST --separatorcolor=$FIRST --verifcolor=$SECOND --wrongcolor=$SECOND --layoutcolor=$FIRST --keyhlcolor=$SECOND --bshlcolor=$SECOND --datecolor=$SECOND --timecolor=$SECOND --screen 1 --indicator --keylayout 2
sleep 30
pgrep i3lock && xset dpms force off
