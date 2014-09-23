#!/bin/sh
. ~/.dzen-popup-config.sh
sleep $KILL_DELAY
killall -e dzen-spawner.sh
/home/jln/.bin/dzen-kill-popup.sh
