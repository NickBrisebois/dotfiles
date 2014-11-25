#!/bin/bash

# Source settings file
. $HOME/.bin/dzen_settings.sh

# Modify Settings
Y=$((Y+70))

TITLE="dmenu_workspaces"

# Source dzen command
. $HOME/.bin/command.sh

while :; do
	line=""
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 2))`; do line="${line}-"; done
    line="${line}+"
    for w in `seq $((cur + 2)) $tot`; do line="${line}-"; done
    echo " ^fg($FG)$line "
  sleep $SLEEP
done | $DZEN & sleep 0.1s && transset-df $OPACITY -n $TITLE
