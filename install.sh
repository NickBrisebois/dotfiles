#!/usr/bin/env bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".bashrc .config/fish .tmux.conf .config/compton.conf .xinitrc .vimrc .vim .Xdefaults .i3/ .ncmpcpp .mpd .bin .config/openbox .config/bard .themes"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

mkdir ~/.config/nvim
ln -s ~/.vim ~/.local/share/nvim/site
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.vim/colors/ ~/.config/nvim/colors

curl https://raw.githubusercontent.com/hbin/top-programming-fonts/master/install.sh | bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git config --global user.name "NickBrisebois"
git config --global user.email "nickbrisebois12@gmail.com"
git config --global core.autocrlf input
git config --global core.safecrlf true
