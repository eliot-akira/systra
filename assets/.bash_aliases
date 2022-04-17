
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
  echo "Clearing file and folder permissions.."
  if [ ! -z "$1" ]; then
    DIR="$1"
  else
    DIR=.
  fi
  sudo chown www-data:www-data -R $DIR/*
  sudo chgrp -R www-data $DIR
  sudo chmod -R g+rw $DIR
  sudo find $DIR -type d -exec chmod 2775 {} \;
  sudo find $DIR -type f -exec chmod ug+rw {} \;
}

# Git

alias gitst='git status'
alias gitrv='git remote -v' # List remotes
alias gitrrm='git remote remove' # Remove remote

alias gitdif="git diff" # --color-words
alias gitdifc="git diff --cached" # Staged commits

alias gitp="git push"
alias gitpl="git pull"

alias gitpb='git push bare master'
alias gitplb='git pull bare master'
alias gitplbp='git pull bare master && git push'

alias gitpom='git push origin master'
alias gitpum='git push -u origin master'

# Install Git submodules
alias gitsubi="git submodule update --init"

alias gitrm='git rm --cached -r' # Remove from tracking

alias gitlg='git log --color --graph --oneline --decorate'
alias gitlg1='git log --pretty=format:%s'
alias gitlgv='git log --since="last version" --pretty=format:"- %s"'

alias gitlgg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

gitback() {
  if [ -z $1 ]; then
    echo "Usage: gitback [number of commits to roll back]"
  else
    git reset --soft HEAD~$1
  fi
}

alias clone='function clone(){ git clone "$@"; };clone'
alias clonel='function clonel(){ git clone --depth 1 --single-branch --branch master "$@" || git clone --depth 1 --single-branch --branch main "$@"; };clonel'


# NGINX

alias nginx-reload='sudo nginx -t && echo -n "Press enter if test passed - Otherwise press CTRL + C to stop.." && read && echo -e "\nRestarting NGINX.." && sudo service nginx reload'

# WordPress

alias www='sudo -u www-data'
alias wp='sudo -u www-data ~/bin/wp'

alias wpp='cd wp-content/plugins'
alias wpt='cd wp-content/themes'
