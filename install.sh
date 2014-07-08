#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files=".bashrc .vim .compton.conf .vimrc .Xdefaults .config/bspwm .config/sxhkd"    # list of files/folders to symlink in homedir

##########

ignore=(stylish-firefox.css README.md install.sh)

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

ignored_item() {
    for i in "${ignore[@]}"; do
        if [ $i == $1 ]; then
            return true
        fi
    done
    return false
}

# creates symlinks for all the files 
for file in *; do
    #echo "Creating symlink to $file in home directory."
    #ln -s $dir/$file ~/$file
    if [$(ignored_item $file) == false]; then
        echo "ok"
    fi
done
