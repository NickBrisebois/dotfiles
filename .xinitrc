
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xsetroot -cursor_name left_ptr

#sxhkd &
#exec bspwm
#exec openbox-session

exec 2bwm &

# Start this after so sxhkd doesn't steal the keys
. $HOME/.xinitrc-2bwm
