# export EDITOR='vim'

###############################################################################
# Bookmarks
###############################################################################

# Bookmarks
alias wp='cd $HOME/workspaces'
alias wd='cd $HOME/workspaces/Dotfiles/'
alias nc='cd $HOME/.config/nvim/'
alias git-d='cd $HOME/Downloads/git-downloads'
alias bootcamp-d='cd $HOME/workspaces/Curso-de-Udemy-web/The\ Complete\ 2023\ Web\ Development\ Bootcamp/'
alias google-d='cd $HOME/Downloads/Google'
###############################################################################
# Basic Aliases
###############################################################################

alias t="touch"
alias rd="rm -rf"
alias q="exit"
alias c="clear"
alias w="which"
alias hgrep="fc -El 0 | grep"
alias vim="nvim"
alias nn="nvim"

alias gpd="git push origin --delete "
alias p3="python3"

#
# C++ C Java Compiling and running
alias jc="javac"
alias j="java"
alias gcpp="g++-11 -std=c++11 -Wall"

###############################################################################
# Build Tool Aliases
###############################################################################

# GoLang Compiling and runing
alias gor="go run"
alias gob="go build"

# Docker aliases
# alias d="docker"
# alias dc="docker-compose"
# alias db="docker build"
# alias dr="docker run"
# alias de="docker exec"
# alias ds="docker stop"
# alias dlo="docker logs"
# alias dps="docker ps"
# alias dimg="docker image"
# alias dimgl="docker image list"
# alias dsp="docker system prune"

#Kubernetes aliases
# alias kv="kubectl version"
# alias kg="kubectl get"
# alias kapi="kubectl apiversions"
# alias kgp="kubectl get pod"
# alias kgd="kubectl get deployment"
# alias kgcrd="kubectl get crd"
# alias kgn="kubectl get namespace"
# alias kd="kubectl delete"
# alias kdp="kubectl delete pods"
# alias kdd="kubectl delete deployment"
# alias kdn="kubectl delete namespace"
# alias kaf="kubectl apply -f"

# Bazel aliases
# alias bar="bazel run"
# alias bab="bazel build'"
# alias bac="bazel clean"
# alias brg="bazel run //:gazelle"
# alias bat="bazel test"

# Maven aliases
# alias mc="mvn clean"
# alias mej="mvn package exec:java"

# npm aliases
alias ns="npm start"
alias nrb="npm run build"
alias nrd="npm run deploy"

###############################################################################
# Github Aliases
###############################################################################

# git aliases
alias gcl="git clone --recurse-submodules"
alias gd="git diff"
alias gp="git push"
alias gpf="git push -f"
alias gl="git pull"
alias ga="git add"
alias gaa="git add --all"
alias gc="git clone" 
alias gcm="git commit -m" 
#alias gcmsg="git commit -m"
# alias gcmsg="git commit -S -m" # This is a signed commit aliases
alias gcam="git commit --amend"
alias gst="git status"
alias gb="git branch"
alias gbD="git branch -D"
alias gco="git checkout"
alias glo="git log --oneline --decorate"
alias glg="git log"
alias gr="git remote"
alias grv="git remote -v"
alias gcf="git config"
alias gcfl="git config -l"
alias grb="git rebase"
alias au="git unadd"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gm="git merge"
alias grs="git restore"
alias gi="git init -b main"
git-re-master() {
  git checkout master && git fetch upstream && git pull upstream master
}
git-re-rebase() {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD) && git-re-master && git checkout $CURRENT_BRANCH && git rebase master
}

###############################################################################
# Directory aliases - Requires autocd to work
###############################################################################

#directory related
alias -g ..='..'         # move up by one directory
alias -g ...='../..'     # move up by two directories
alias -g ....='../../..' # move up by three directories

alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='/usr/bin/bat --paging=never'
alias catn='cat'
alias catl='bat'
alias imgkitty='kitty +kitten icat'
alias tree='exa -aT --color=always --group-directories-first'
# alias nmtui="xdotool getactivewindow set_window --class nmtui ; nmtui ; xdotool getactivewindow set_window --class XTerm"
alias lx='exa --icons --group-directories-first -lh'
alias grep='grep --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ff='fzf-lovely'

alias nano='nano -x -O'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias catj='cat -l java'
alias up='sudo dnf update -y'
alias up5='sudo dnf5 upgrade -y'
alias live='live-server'
alias john='/opt/pentesting/john/run/john'
#alias tldr='tldr'
#alias navi='navi'
# command -v nvim >/dev/null && alias vim='nvim'
