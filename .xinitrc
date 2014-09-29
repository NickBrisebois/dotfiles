
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xsetroot -cursor_name left_ptr

compton &
nitrogen --restore &
unclutter &
start-pulseaudio-x11 &
clipit &
#plank &
#mpd-notification &
/home/nick/.bin/mpd-notify &
xscreensaver &

sxhkd & 
exec bspwm

#session=${1:-sxhkd & exec bspwm}

#case $session in 
#    bspwm ) sxhkd & exec bspwm;;
#    xfce ) xfce4-session;;
#    *) exec $1;;
#esac

