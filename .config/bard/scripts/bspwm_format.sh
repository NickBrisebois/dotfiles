IFS=$':' 
for i in $2 ; do
	tagfgcol=""
	tagstr=""
	case ${i:0:1} in
		'F')
			tagfgcol="\$color[green]"
			tagstr=" - "
			;;
		'f')
			tagfgcol="\$color[grey]"
			tagstr=" - "
			;;
		'o')
			tagfgcol="\$color[grey]"
			tagstr=" + "
			;;
		'O')
			tagfgcol="\$color[green]"
			tagstr=" + "
			;;
		'M' | 'W' | 'm')
			echo -n "%{F\$color[red]}["
			;;
		'L')
			echo -n "%{F\$color[red]}]"
			;;
		*)
			continue
			;;
	esac
	if [[ ! -z $tagstr ]] ; then
		echo -n "%{F$tagfgcol}"
		# clickable tags
		echo -n "$tagstr" #${i:1} to get the text
	fi
done
