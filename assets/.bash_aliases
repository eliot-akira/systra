
export PATH="$PATH:~/.yarn/bin"
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"' # Terminal window title

unset MAILCHECK

alias edit=nano

alias push="pushd" # Go to given folder, push it on stack
alias pop="pushd +1" # Pop folder stack

alias ~='function cdUser(){ cd ~/$1; };cdUser'
alias ..='function cd2(){ cd ../$1; };cd2'
alias ...='function cd3(){ cd ../../$1; };cd3'
alias ....='function cd4(){ cd ../../../$1; };cd4'
alias .....='function cd5(){ cd ../../../../$1; };cd5'

mkcd () { mkdir "$@" && cd "$@"; }
alias less='less -FSRXc'
alias la="ls -ahGl"
alias cl='clear'
alias cla="cl && la"

# Create file and edit
alias touche='function touche(){ touch "$@" ; edit "$@";};touche'
# Create executable file and edit
alias touchex='function touchex(){ touch "$@" ; chmod +x "$@" ; edit "$@";};touchex'

# Reload this shell script
alias bashr="source ~/.bash_aliases"
# Edit this shell script
alias bashe="edit ~/.bash_aliases"

# Find file
alias ff='find . -type f -iname "$@"'
# Find directory
alias fd='find . -type d -iname "$@"'
# Find symlink
alias fl='find . -type l -iname "$@"'

# Recursive grep
alias grr='function grr(){ grep -rHIn --exclude-dir=public --exclude-dir=*/_* --exclude-dir=*/@* --exclude-dir=node_modules --exclude-dir=.git --exclude=*.min.* --exclude=*.map --exclude=*.lock --exclude=package-lock.json "$@" . 2>&1 | grep -v "No such file" ;}; grr'

# Server management

clearp() {
  if [ -z "$1" ]; then
    echo -e "\nClear file and folder permissions\n"
    echo -e "Usage: clearp [folder name or .]\n"
    exit
  fi
  DIR="$1"
  sudo chown www-data:www-data -R $DIR/*
  sudo chgrp -R www-data $DIR
  sudo chmod -R g+rw $DIR
  sudo find $DIR -type d -exec chmod 2775 {} \;
  sudo find $DIR -type f -exec chmod ug+rw {} \;
}

alias www='sudo -u www-data'
alias wp='sudo -u www-data ~/bin/wp'

alias wpp='cd wp-content/plugins'
alias wpt='cd wp-content/themes'
