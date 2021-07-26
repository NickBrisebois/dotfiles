#
set -x GOPATH "/Users/nibriseb/go"
set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/go/bin
set -x PATH $PATH ~/.nvm/
set -x PATH $PATH $GOPATH/bin

set -U EDITOR nvim

# Disable venv prompt prefix as we use our own
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -x -U GOPATH $HOME/go

# Docker aliases
alias dc="docker-compose"
alias dcrs="dc stop; echo \"y\" | dc rm; dc up -d"

alias cat="bat"

#ls aliases
alias la="ls -a"
alias ll="ls -la"

alias mkdir="mkdir -pv"
alias cp="cp -i"

alias pull="git pull --ff-only"

alias vim=nvim

function search
    grep -rnw $argv[1] -e $argv[2]
end

source ~/.config/fish/colours.fish

# Configure fish git prompt
set -g __fish_git_prompt_showupstream auto
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green

# set fish_greeting ""

function fish_right_prompt
  set -l last_status $status
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l normal (set_color normal)

  echo -n -s $normal '[' $green (prompt_pwd) $normal ']'

  if test $last_status -ne 0
    set_color red
    printf ' ≡ %d' $last_status
    set_color normal
  end
  
end

function fish_prompt
  set -l last_status $status
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
  echo -n -s (fish_git_prompt)

  # Was last command succesful or not
  if test $last_status = 0
      set status_indicator "$green» "
  else
      set status_indicator "$red✗ "
  end

  # Notify if a command took more than 5 minutes
  if [ "$CMD_DURATION" -gt 300000 ]
    echo The last command took (math "$CMD_DURATION/1000") seconds.
  end
  
  # Terminate with a nice prompt char
  echo -n -s $blue(whoami)$normal'@'$yellow(hostname) $normal ' ' $status_indicator $normal
end


# Cisco
set -x VMS_HOME $HOME/vms-3.1
set -x NSO_HOME $VMS_HOME/nso-4.7.1.1
 
set -x VMSSPCICD_HOME "$VMS_HOME/vmsspcicd"
set -x MS_JAR_HOME "$HOME/msx/stage/platform"
set -g fish_user_paths "/usr/local/opt/maven@3.5/bin" $fish_user_paths

export NVM_DIR="$HOME/.nvm"

set -x NO_PROXY "34.232.123.22,127.0.0.0/8,127.0.0.1,localhost,,.cisco.com,engci-maven.cisco.com,https://engci-maven-master.cisco.com,.cisco.com,172.,10.*"
set -x ROUTERSERVICE_HOST 10.81.85.95
set -x VMS_VM 10.81.85.95
