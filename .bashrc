#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:/home/nick/.bin
export PATH

# environment variables
export EDITOR="nvim"	# gedit, nano

# pacman aliases (if desired, adapt for your favourite AUR helper)
alias pac="sudo pacman -S"		# default action	- install one or more packages
alias pacu="sudo pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo pacman -Rsc"		# '[r]emove'		- uninstall one or more packages
alias pacs="pacsearch"		# '[s]earch'		- search for a package using one or more keywords

folsize() {
   du -c -h $1 | grep 'total';
}

scrot() {
    cd ~/Pictures/screenshots/;
    scrot $1;
    cd -;
}


alias :q="exit"
alias mpdwave="mpdviz --scale=5 -v 'spectrum' --icolor=true --imode='grayscale'"
alias screenshot="instagram -s 0"
alias mu="ncmpcpp"

#-------------------------------
# function: type "path" in terminal for ordered $PATH display:
#------------------------------

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}
#------------------------------- 

#-------------------------------
# Aliases to save time & typing:
#-------------------------------

alias ka="killall"    
alias al="alias"
alias ll="ls -lh"
alias llm="ls -lh"
alias la="ls -a"
alias lam="ls -a"
alias exit="clear; exit"
alias x="startx"
alias h="htop"
alias a="alsamixer"
alias m="sudo mount -a"
alias please='eval "sudo $(fc -ln -1)"'
alias xbks='xbindkeys'
alias lsid='ls -lah /dev/disk/by-id/'

alias ls='ls'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vp='vim PKGBUILD'
alias vs='vim SPLITBUILD'

#================================================

complete -cf sudo  # Sets bash completion

# shopt (shell options) - comments are too brief & ambigous - see man page:

shopt -s autocd         # automatically cd's to path entered at the prompt   
shopt -s cdspell      # corrects minor spelling errors in when using cd
shopt -s checkwinsize      # as the name says - after each bash command
shopt -s cmdhist      # attempts to save multiple line commands in the history
shopt -s dotglob      # includes <.dot> files in file name expansion if poss'
shopt -s expand_aliases      # aliases are expanded
shopt -s extglob      # the extended pattern matching enabled
shopt -s histappend      # history from exited shell kept for next open shell 
shopt -s hostcomplete      # host name completion when @ is in the word
shopt -s nocaseglob      # case-insensitive when performing filename expansion

export HISTSIZE=90000      # sets the size of the bash history file
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

#-----------------------------------------
# history completion using the arrow keys:
#-----------------------------------------

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#-----------------------------------------


# ex - archive extractor   # command line archive extractor, came with Manjaro 
# usage: ex <file>
ex () {
    if [[ -f $1 ]] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.tar.xz)    tar xJf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}



#============================================================= 
# cd & ls in one :- when you cd to a directory the ls command 
# automatically lists it's contents however you have configred 
# ls to do so:
#-------------------------------------------------------------

cl() {
if [ -d "$1" ]; then
   cd "$1"
   ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F   
   else
   echo "bash: cl: '$1': Directory not found"
fi
}

#=============================================================
# cd & ls & more in the same command. Pipes the output to more 
#for use with directories with many files in their contents:
#-------------------------------------------------------------

# cd and ls & more in one
cm() {
if [ -d "$1" ]; then
   cd "$1"
   ls | more
   else
   echo "bash: cl: '$1': Directory not found"
fi
}
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias webrip="wget -r --no-parent -k"
alias ll="ls -lh"
alias la="ls -a"
alias exit="clear; exit"
alias x="startx"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias tree='tree -dA'
alias kill9='kill -9 $1'


conf() {

case $1 in
bspwm)	cd ~/dotfiles/.config/bspwm; ls;;
sxhkd)  vim ~/.config/sxhkd/sxhkdrc; cd ~; pkill sxhkd; sxhkd & disown ;;
openbox) cd ~/.config/openbox; vim rc.xml ;;
2bwm) cd ~/.config/2bwm-src/; vim config.h ;; 
pacman)	sudo vim /etc/pacman.conf ;;
vim)	vim ~/.vimrc ;;
xinit)	vim ~/.xinitrc ;;
xresource)	vim ~/.Xresources && xrdb ~/.Xresources ;;
bashrc)	vim ~/.bashrc && source ~/.bashrc ;;
compton) vim ~/.compton.conf && killall compton && compton -b ;;
*)	echo "Unknown application: $1" ;;
esac
}


#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

PS1="\[\e[1;34m\]\u\[\e[0m\] » [\[\e[1;32m\]\W\[\e[0m\]]\[\e[1;37m\]:\[\e[0m\] "
BROWSER=/usr/bin/xdg-open

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
