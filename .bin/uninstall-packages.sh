#!/bin/sh
SKIP_FILE=".uninstall-packages.skip"
touch $SKIP_FILE

for package in $(pacman -Qqe)
do

    # if a dependency of $package is in the $SKIP_FILE, this package cannot be uninstalled:
    #   - skip?
    #   - show fewer options?
    # this requires that $SKIP_FILE only contains installed packages

    if grep -Fxq "$package" $SKIP_FILE
    then
        # Skip package
        echo
    else
        # Don't skip package
        echo "$(pacman -Qi "$package" | grep "Required By\|Name\|Version\|Description\|Depends On\|Installed Size")"
        read -p "Uninstall? [y/n/N/s/r/?] " -n 1 -r
        echo

        if [[ $REPLY =~ ^[Qq]$ ]]
        then
            exit

        elif [[ $REPLY =~ ^[?]$ ]]
        then
            echo
            echo "y - (y)es, uninstall package"
            echo "n - (n)o, don't uninstall package"
            echo "N - (N)o, don't uninstall package and never ask for this package again"
            echo "s - recur(s)ive, uninstall package and all of its dependencies that are no longer needed and have not been installed as explicit"
            echo "r - (r)ecursive, uninstall package and all of its dependencies that are no longer needed"
            echo "? - Show this help"
            # TODO show current again

        elif [[ $REPLY =~ ^[Yy]$ ]]
        then
            #echo "Uninstall $package"
            sudo pacman -R $package

        elif [[ $REPLY =~ ^[N]$ ]]
        then
            echo $package >> $SKIP_FILE

        elif [[ $REPLY =~ ^[Ss]$ ]]
        then
            #echo "Uninstall $package recursive, remove not explicit deps"
            sudo pacman -Rs $package

        elif [[ $REPLY =~ ^[Rr]$ ]]
        then
            #echo "Uninstall $package recursive"
            sudo pacman -Rss $package
        fi

        echo
    fi
done
