#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:/home/nick/bin:/home/nick/bin/sublime:/home/nick/.config/bspwm/
export PATH

# environment variables
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'leafpad'; else echo 'vim'; fi)"	# gedit, nano

# pacman aliases (if desired, adapt for your favourite AUR helper)
alias pac="sudo /usr/bin/pacman -S"		# default action	- install one or more packages
alias pacu="sudo /usr/bin/pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rns"		# '[r]emove'		- uninstall one or more packages
alias pacrc="sudo /usr/bin/pacman -Rnsc"
alias pacs="/usr/bin/pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"		# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="sudo /usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="sudo /usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# aur aliases
alias yaur="yaourt -Syua"

alias aur="yaourt"
alias pkS="packer"

alias thunard="dbus-launch thunar"

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

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
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
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
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
sxhkd)	cd ~/dotfiles/.config/sxhkd; vim ~/.config/sxhkd/sxhkdrc ;;
openbox) cd ~/.config/openbox; vim rc.xml ;;
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
