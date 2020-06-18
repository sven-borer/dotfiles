FILE="/etc/X11/xorg.conf.d/70-synaptics.conf"
/bin/cat <<EOM >$FILE
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection

Section "InputClass"
    Identifier "mouse"
    MatchProduct "USB OPTICAL MOUSE"
    Driver "libinput"
    Option "NaturalScrolling" "false"
    Option "AccelSpeed" "0.5"
EndSection
EOM

FILE="/etc/X11/xorg.conf.d/10-monitor.conf"
/bin/cat <<EOM >$FILE
Section "Monitor"
    Identifier "eDP1"
    Option "Primary" "true"
EndSection

Section "Monitor"
    Identifier "DP2-2"
    Option "RightOf" "eDP1"
EndSection
EOM

sed -i '/Color/s/^#//g' /etc/pacman.conf

sed -i '/HandleLidSwitchDocked=/s/^#//g' /etc/systemd/logind.conf
sed -i '/HandleLidSwitch=/s/^#//g' /etc/systemd/logind.conf

git config --global user.email "borer.sven@gmail.com"
git config --global user.name "Sven Borer"
git config --global url.ssh://git@github.com/.insteadOf https://github.com/