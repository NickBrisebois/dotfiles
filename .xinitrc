
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xsetroot -cursor_name left_ptr

compton &
thunar --daemon &
nitrogen --restore &
unclutter &
start-pulseaudio-x11

session=${1:-sxhkd & exec bspwm}

case $session in 
    bspwm ) sxhkd & exec bspwm;;
    *) exec $1;;
esac

