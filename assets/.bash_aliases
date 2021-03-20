
export PATH="$PATH:~/.yarn/bin"
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"' # Terminal window title

unset MAILCHECK

alias edit=nano
alias go="pushd"
alias back="pushd +1"

alias ~='function cdUser(){ cd ~/$1; };cdUser'
alias ..='function cd2(){ cd ../$1; };cd2'
alias ...='function cd3(){ cd ../../$1; };cd3'
alias ....='function cd4(){ cd ../../../$1; };cd4'
alias .....='function cd5(){ cd ../../../../$1; };cd5'

mkcd () { mkdir "$@" && cd "$@"; }
alias less='less -FSRXc'
alias la="ls -ahGl"

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
