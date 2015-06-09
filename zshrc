[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
if [[ -e ~/.zsh_local ]]; then
    source ~/.zsh_local
fi
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


DEFAULT_USER="thor"

HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git cp history python ruby rvm ssh-agent keybase)

source $ZSH/oh-my-zsh.sh

if hash gls 2> /dev/null; then
    alias ls="gls -v --color=auto"
    eval `gdircolors ~/.dir_colors`
else
    if (ls --color=auto > /dev/null 2>&1); then
        alias ls="ls -v --color=auto"
    else
        alias ls="ls " # assume we are using a dumb LS
    fi
    if hash dircolors 2> /dev/null; then
        eval `dircolors ~/.dir_colors`
    fi
fi
export EDITOR="vim"
export DISABLE_AUTO_TITLE=true


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

p() { cd ~/src/$1; }
_p() { _files -W ~/src -/; }
compdef _p p

extract () {
   if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2) tar xjf $1                                      ;;
        *.tar.gz)  tar xzf $1                                      ;;
        *.tgz)     tar xzf $1                                      ;;
        *.bz2)     bunzip2 $1                                      ;;
        *.rar)     rar x $1                                        ;;
        *.gz)      gunzip $1                                       ;;
        *.tar)     tar xf $1                                       ;;
        *.tbz2)    tar xjf $1                                      ;;
        *.tbz)      tar xjf $1                                     ;;
        *.tgz)     tar xzf $1                                      ;;
        *.zip)     unzip $1                                        ;;
        *.Z)       uncompress $1                                   ;;
        *)         echo "'$1' cannot be extracted via extract()"   ;;
      esac
   else
      echo "'$1' is not a valid file"
  fi
}

function gi() { curl -L -s https://www.gitignore.io/api/$1 ; }



# Make IGNORE_EOF work like in bash
#setopt IGNORE_EOF
#IGNOREEOF=1
bash-ctrl-d() {
    if [[ $CURSOR == 0 && -z $BUFFER ]]
    then
        [[ -z $IGNOREEOF || $IGNOREEOF == 0 ]] && exit
        if [[ $LASTWIDGET == bash-ctrl-d ]]
        then
            (( --__BASH_IGNORE_EOF <= 0 )) && exit
        else
            (( __BASH_IGNORE_EOF = IGNOREEOF-1 ))
        fi
        echo -n Use \"logout\" to leave the shell.
        zle send-break
    else
        zle delete-char-or-list
    fi
}
#zle -N bash-ctrl-d
#bindkey "^D" bash-ctrl-d

setopt SHORT_LOOPS             # Allow short form of loops.


PATH=$PATH:$HOME/.rvm/bin:/$HOME/bin

[ -s "/home/thor/.dnx/dnvm/dnvm.sh" ] && . "/home/thor/.dnx/dnvm/dnvm.sh" # Load dnvm
