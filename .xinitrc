
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xsetroot -cursor_name left_ptr

compton &
nitrogen --restore &
wmname LG3D & 
unclutter &
start-pulseaudio-x11 &
clipit &
#plank &
#mpd-notification &
/home/nick/.bin/mpd-notify &
xscreensaver &
wmname LG3D & 

sxhkd &
exec bspwm
