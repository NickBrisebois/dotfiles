#!/bin/bash
out=$(amixer get Master | grep "\[on\]" | egrep -o "[0-9]+%" | head -1 | cut -d % -f 1)
if [ -z "$out" ]; then
    echo "mute"
else
    echo "$out"
fi
