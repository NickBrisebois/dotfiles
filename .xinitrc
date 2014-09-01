
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xsetroot -cursor_name left_ptr

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
 
bspc control --subscribe > "$PANEL_FIFO" &
xtitle -sf 'T%s' > "$PANEL_FIFO" &
conky -c $HOME/.config/bspwm/conkyrc > "$PANEL_FIFO" &
#clock -sf 'S%D %A %H:%M' > "$PANEL_FIFO" &

compton -e 0.2 &
nitrogen --restore &
unclutter &
start-pulseaudio-x11 &
clipit &
plank &
mpd-notification &

sxhkd & 
exec bspwm


#session=${1:-sxhkd & exec bspwm}

#case $session in 
#    bspwm ) sxhkd & exec bspwm;;
#    xfce ) xfce4-session;;
#    *) exec $1;;
#esac

