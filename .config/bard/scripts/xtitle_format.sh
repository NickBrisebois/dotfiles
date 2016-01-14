#!/bin/bash

echo -n "%{B#ccad99}%{F#3e5059} "
echo -n $2; echo -n " " | awk -v len=80 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
