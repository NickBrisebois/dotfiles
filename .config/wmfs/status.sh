#!/bin/sh
#WMFS status.sh example file
conky -c ~/.config/wmfs/conkyrc | while true; read line; do wmfs -c status "conkybar $line"; done &
