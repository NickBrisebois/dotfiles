essid=$3
quality=$5

if [[ -z $essid ]]; then
	essid=" Wifi: Not connected "
fi

echo -n "%{B#7c9fa6} Wifi:"
if [[ quality -gt 80 ]]; then
	echo -en "%{F\$color[blue]}\uE222"
elif [[ quality -gt 40 ]]; then
	echo -en "%{F\$color[yellow]}\uE221"
elif [[ quality -gt 20 ]]; then
	echo -en "%{F\$color[red]}\uE220"
else
	echo -en "%{F\$color[red]}\uE21F"
fi
echo " %{T-}%{F-}$essid "
