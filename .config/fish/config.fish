#

set -x PATH $PATH /snap/bin

set -x PATH $PATH ~/go/bin

set -U EDITOR vim

#Vim like quit that I do by mistake sometimes
alias :q="exit"

#Pacman aliases
alias pacs="pacsearch"
alias pacr="sudo pacman -Rsc"
alias pac="sudo pacman -S"
alias pacu="sudo pacman -Syu"

alias apts="apt-cache search"
alias aptr="sudo apt-get remove --purge"
alias apt="sudo apt-get install"
alias aptu="sudo apt-get upgrade"
alias aptdu="sudo apt-get dist-upgrade"

alias dc="docker-compose"
alias dcrs="dc stop; echo \"y\" | dc rm; dc up -d"

#Music aliases
alias mu="ncmpcpp"

#ls aliases
alias la="ls -a"
alias ll="ls -la"

alias mkdir="mkdir -pv"
alias cp="cp -i"

set fish_greeting ""

function ex 
  if set -q argv
      switch ($argv) 
        case *.tar.bz2
          tar xjf $argv 
        case *.tar.gz
          tar xzf $argv
        case *.tar.xz 
          tar xJf $argv
        case *.bz2
          bunzip2 $argv
        case *.rar 
          unrar e $argv
        case *.gz 
          gunzip $argv
        case *.tar
          tar xf $argv
        case *.tbz2 
          tar xjf $argv
        case *.tgz
          tar xzf $argv
        case *.zip
          unzip $argv
        case *.Z
          uncompress $argv
        case *.7z 
          7z x $argv
        case *
          echo "Could not be extracted"
        end
    end
end

function fish_right_prompt_disabled
  set -l last_status $status
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l normal (set_color normal)

  echo -n -s $normal '[' $green (prompt_pwd) $normal ']'

  if test $last_status -ne 0
    set_color red
    printf ' %d' $last_status
    set_color normal
  end
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

#function fish_promt
function fish_prompt_disabled
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l cwd $cyan(basename (prompt_pwd))

  # output the prompt, left to right

  # Add a newline before prompts
  echo -e ""

  # Display [venvname] if in a virtualenv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b cyan black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
  end

  # Display the current directory name
  echo -n -s $normal


  # Show git branch and dirty state
  if [ (_git_branch_name) ]
    set -l git_branch '[' (_git_branch_name) ']'

    if [ (_is_git_dirty) ]
      set git_info $red $git_branch " ~= "
    else
      set git_info $green $git_branch
    end
    echo -n -s $git_info $normal
  end

  # Terminate with a nice prompt char
  echo -n -s $blue(whoami)$normal'@'$yellow(hostname)$normal' - ' $normal
end

starship init fish | source
