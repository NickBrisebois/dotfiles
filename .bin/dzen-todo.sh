#!/bin/bash

. ~/.dzen-popup-config.sh

SCREEN_WIDTH=$(sres -W)
WIDTH="400"
XPOS=$((SCREEN_WIDTH-WIDTH-PADDING_RIGHT-150))

text=$(todo.sh -p list | head -n -3)
LINES=$(echo "$text" | wc -l)

echo "$text" | dzen2 -p -fg $FOREGROUND -bg $BACKGROUND -fn "${FONT}:pixelsize=${FONT_SIZE}" -x $XPOS -y $YPOS -w $WIDTH -l $LINES -ta l -sa l -e 'onstart=uncollapse;button1=exit;button3=exit' -title-name 'dzen-popup-todo'
