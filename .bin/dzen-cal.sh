#!/bin/bash

# pop-up calendar for dzen
#
# based on (c) 2007, by Robert Manea
# http://dzen.geekmode.org/dwiki/doku.php?id=dzen:calendar
# modified by urukrama
# modified by senft
#

. ~/.dzen-popup-config.sh

SCREEN_WIDTH=$(sres -W)

WIDTH=150
LINES=17

XPOS=1194
XPOS=$((SCREEN_WIDTH-WIDTH-PADDING_RIGHT))

TODAY=$(expr `date +'%d'` + 0)
MONTH=`date +'%m'`
YEAR=`date +'%Y'`

(echo
# current month, hilight header and today
cal | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg($HIGHLIGHT)\1^fg()/;s/(^|[ ])($TODAY)($|[ ])/\1^fg($HIGHLIGHT)\2^fg()\3/"

# next month, hilight header
[ $MONTH -eq 12 ] && YEAR=`expr $YEAR + 1`
cal `expr \( $MONTH + 1 \) % 12` $YEAR \
    | sed -e "s/^\(.*[A-Za-z][A-Za-z]*.*\)$/\1/"
) | dzen2 -p -bg $BACKGROUND -fg $FOREGROUND -fn "${FONT}:pixelsize=${FONT_SIZE}" -x $XPOS -y $YPOS -w $WIDTH -l $LINES -sa c -e 'onstart=uncollapse;button1=exit;button3=exit' -title-name 'dzen-popup-cal'
