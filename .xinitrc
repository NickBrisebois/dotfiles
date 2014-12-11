
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xsetroot -cursor_name left_ptr

nitrogen --restore &
compton --config ~/.config/compton.conf &
sxhkd -c ~/.config/sxhkdrc &
exec bspwm

#exec openbox-session

