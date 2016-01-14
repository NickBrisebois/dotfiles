#!/usr/bin/env bash

artist=`sp metadata | grep artist | cut -f2- -d'|'`
title=`sp metadata | grep title | cut -f2- -d'|'`

echo -n $artist 
echo -n ' - ' 
echo -n $title

