#!/usr/bin/env bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

shell_config_only=false

while getopts ":s" o; do
    case "${o}" in
        s)
            echo Only installing shell configs
            shell_config_only=true
            ;;
    esac
done

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=""

if $shell_config_only
then
    files=".config/fish .bashrc .xDefaults"
else
    files=".bashrc .config/fish .tmux.conf .xDefaults .vimrc .vim"    # list of files/folders to symlink in homedir
fi

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

if ! $shell_config_only
then
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
fi

# install vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install vim-plug for nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvm for fish
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config

for i in conf.d functions completions
  curl https://git.io/$i.nvm.fish --create-dirs -sLo $XDG_CONFIG_HOME/fish/$i/nvm.fish
end
