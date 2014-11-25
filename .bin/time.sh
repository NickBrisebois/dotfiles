#!/bin/bash

# Source settings file
. $HOME/.bin/dzen_settings.sh

TITLE="dzen_time"

# Source dzen command
. $HOME/.bin/command.sh

while :; do

  echo " ^fg($FG) \
$(xtitle) \
^fg($FG) | \
^fg($FG) $(date +%I:%M%P)   "

  sleep $SLEEP
done | $DZEN & sleep 0.1s && transset-df $OPACITY -n $TITLE 
