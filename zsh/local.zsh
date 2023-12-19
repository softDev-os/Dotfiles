# Fix the Java Problem
source $HOME/.cargo/env
export PATH=~/bin:$PATH
export CC="ccacheV gcc"
export PATH="$PATH:~/.nvm/versions/node/v20.7.0/bin/prettier"
export PATH="$PATH:$HOME:/usr/local/rvm/gems/ruby-3.0.5/bin"
export CXX="ccache g++"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Esto carga NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Esto carga la finalización automática de NVM
export _JAVA_AWT_WM_NONREPARENTING=1
setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt nobeep
setopt autopushd
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

#Editor prederminado
# set -gx EDITOR nvim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Uncomment the follwing two lines to add tab completion
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Uncomment the follwing line to match lowercase letters to uppercase letters for tab completion and vice versa
bindkey -v

# Uncomment the follwing four lines to configure custom zsh history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
SAVEHIST=3000
HISTSIZE=2999
HISTFILE=~/.zsh_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

typeset -g STARTUP="1"
# Functions
function mkt(){
    mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractPorts(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    bat -l java extractPorts.tmp; rm extractPorts.tmp
}

# Settarget

function settarget(){
    if [ $# -eq 1 ]; then
        echo $1 > ~/.config/bin/target
        elif [ $# -gt 2 ]; then
        echo "settarget [IP] [NAME] | settarget [IP]"
    else
        echo $1 $2 > ~/.config/bin/target
    fi
}


# fzf improvement
function fzf-lovely(){
    
    if [ "$1" = "h" ]; then
        fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
        cat {}) 2> /dev/null | head -500'
        
    else
        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                         coderay {} ||
	                          rougify {} ||
        cat {}) 2> /dev/null | head -500'
    fi
}

# function rmk(){
#     scrub -p dod $1
#     shred -zun 10 -v $1
# }

function rmk() {
    local file_or_dir="$1"
    
    if [ -z "$file_or_dir" ]; then
        echo "Uso: rmk <archivo o directorio>"
        return 1
    fi

    # Verificar si el archivo o directorio existe
    if [ ! -e "$file_or_dir" ]; then
        echo "$file_or_dir no existe."
        return 1
    fi

    if [ -f "$file_or_dir" ]; then
        # Si es un archivo, borrarlo de manera segura
        scrub -p dod "$file_or_dir"
        shred -zun 10 -v "$file_or_dir"
    elif [ -d "$file_or_dir" ]; then
        # Si es un directorio, borrarlo de manera recursiva
        rm -r "$file_or_dir"
    else
        echo "$file_or_dir no es ni un archivo ni un directorio."
        return 1
    fi

    echo "$file_or_dir ha sido borrado de manera segura."
}

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^E" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^U" backward-kill-line
bindkey "^B" beginning-of-line
