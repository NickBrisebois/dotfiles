battery_status=$2
battery_percentage=$3

echo -n "%{T\$font[icon]}"
if [ "$battery_status" == "Charging" ] || [ "$battery_status" == "Full" ]; then
	echo -en "%{F\$color[green]}\uE239"
elif [[ $battery_percentage > 50 ]]; then
	echo -en "%{F\$color[green]}\uE238"
elif [ "$battery_status" == "Discharging" ] && [[ $battery_percentage > 10 ]]; then
	echo -en "%{F\$color[yellow]}\uE237"
else
	echo -en "%{F\$color[brightred]}\uE236"
fi
echo " %{T-}%{F-}$battery_percentage"
