#!/bin/bash
COLOR_ON="#eddcd3"
COLOR_OFF="#989584"
BAR_MAX_WIDTH=40
BAR_HEIGHT=6
vol=`amixer get Master | egrep -o "[0-9]+%" | head -1 | sed 's/%//'`
mute=`amixer get Master | grep "\[on\]"`

if [ -n "$mute" ]; then
    if [ $vol -gt 50 ]; then
        printf "^i(/home/jln/.icons/xbm8x8/spkr_01.xbm) "
    else
        printf "^i(/home/jln/.icons/xbm8x8/spkr_01_low.xbm) "
    fi
else
    printf "^i(/home/jln/.icons/xbm8x8/spkr_01_mute.xbm) "
fi
echo $vol | gdbar -h $BAR_HEIGHT -w $BAR_MAX_WIDTH -fg $COLOR_ON -bg $COLOR_OFF
