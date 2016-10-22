## Note*: some programs, such as 'nm-applet' are run via XDG autostart.
## Run '/usr/lib/openbox/openbox-xdg-autostart --list' to list any
## XDG autostarted programs.
##
## More information about this can be found at:
## http://openbox.org/wiki/Help:Autostart

## Set root window colour
hsetroot -solid "#2A2A2A" &

## Volume keys daemon
xfce4-volumed &

## Enable power management and disable xset things
xset s off
xset -dpms
xfce4-power-manager

## Start Thunar Daemon
thunar --daemon &

## Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
## Adjust the values according to your preferances.
xset r rate 250 25 &

## Turn on/off system beep
xset b off &

#Rebind keys
xmodmap ~/.dotfiles/xmodmap

#Open terminal window here and also on d2
(sleep 5 && terminator-d2) &
(sleep 2 && terminator) &

#Fuck making my own sessions
muxspawn &

#Bluetooth plz
(sleep 2 && blueman-applet) &

#Start conky
(sleep 2 && conky -c ~/.conky/conkyrc) &

#Autostart redshift
(sleep 10 && redshift) &

#Dat music
(sleep 5 && spotify-d4) &

#Get tint2 going
(sleep 1 && tint2) &

#Start browsing
(sleep 1 && firefox) &

#File syncing
(sleep 3 && owncloud) &
(sleep 4 && syncthing) &

#Backup the current package list
dpkg --get-selections > $HOME/.config/dpkg.list
