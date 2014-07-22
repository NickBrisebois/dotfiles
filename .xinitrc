
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xsetroot -cursor_name left_ptr

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
 
bspc config top_padding 20
 
bspc control --subscribe > "$PANEL_FIFO" &
xtitle -sf 'T%s' > "$PANEL_FIFO" &
conky -c $HOME/.config/bspwm/conkyrc > "$PANEL_FIFO" &
#clock -sf 'S%D %A %H:%M' > "$PANEL_FIFO" &

compton &
#thunar --daemon &
nitrogen --restore &
unclutter &
start-pulseaudio-x11 &

PANEL_FIFO="/tmp/panel-fifo"

session=${1:-sxhkd & exec bspwm & panel}

case $session in 
    bspwm ) sxhkd & exec bspwm;;
    *) exec $1;;
esac

