#!/bin/bash

# Source settings file
. $HOME/.bin/dzen_settings.sh

# Modify Settings
Y=$((Y+35))
TITLE="dzen_mpd"

# Source dzen command
. $HOME/.bin/command.sh

while :; do

  echo " ^fg($FG)^ca(1,mpc toggle)^ca(3,urxvt -e ncmpcpp)^ca(4,mpc next)^ca(5,mpc prev) \
$(mpc -f %artist% current | tr '[:lower:]' '[:upper:]') \
^fg($FG) - \
^fg($FG) \
$(mpc -f %title% current | tr '[:lower:]' '[:upper:]')^ca()^ca()^ca()^ca() \
^fg($FG) | \
^fg($FG)^ca(4,amixer set Master 5%+)^ca(5,amixer set Master 5%-) \
$(amixer sget Master | grep -m1 "%]" | cut -d "[" -f2 | cut -d "]" -f1)   ^ca()^ca()"

  sleep $SLEEP & 
done | $DZEN & sleep 0.1s && transset-df $OPACITY -n $TITLE
