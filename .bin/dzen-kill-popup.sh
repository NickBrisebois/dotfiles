#!/bin/sh
. ~/.dzen-popup-config.sh

pid=$(pgrep -f "dzen-popup")
if [ ! -z "$pid" ]; then
    kill $pid
fi
