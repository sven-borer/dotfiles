[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
export QT_AUTO_SCREEN_SCALE_FACTOR=0
exec i3
