# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

alias startpgsql="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

alias GET="lwp-request"

alias startRamDisk="diskutil erasevolume HFS+ 'RAM Disk' `hdiutil attach -nomount ram://8388608`"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew cp gnu-utils golang history mercurial nyan python ruby rvm ssh-agent sublime textmate themes tmuxinator web-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export TERM=screen-256color 

alias ls="ls --color=auto"
eval `dircolors ~/.dir_colors`

# Customize to your needs...
export PATH=/Users/thor/PebbleSDK-1.12/arm-cs-tools/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/thor/.rbenv/shims:/usr/local/share/npm/bin:/Users/thor/adt-bundle-mac-x86_64-20130917/sdk/platform-tools:/Users/thor/adt-bundle-mac-x86_64-20130917/sdk/tools:/Users/thor/.rvm/bin:/Users/thor/bin

export EDITOR="vim"
export DISABLE_AUTO_TITLE=true


export PGDATA="/usr/local/var/postgres/9.3/"


export HOMEBREW_GITHUB_API_TOKEN="661f723308d839ba2af84f517bf13fbd1a7b4eec"

p() { cd ~/src/$1; }
_p() { _files -W ~/src -/; }
compdef _p p

add_key () {
   ssh 10.0.0.3 "/interface wireless access-list add forwarding=no authentication=yes interface=wlan1 mac-address=$1"
}

extract () {
   if [ -f $1 ] ; then
      case $1 in
         *.tar.bz2)  tar xjf $1              ;;
         *.tar.gz)   tar xzf $1              ;;
         *.tgz)      tar xzf $1              ;;
         *.bz2)      bunzip2 $1              ;;
         *.rar)      rar x $1                ;;
         *.gz)    	 gunzip $1               ;;
         *.tar)      tar xf $1               ;;
         *.tbz2)     tar xjf $1              ;;
		 *.tbz)		 tar xjf $1				 ;;
         *.tgz)      tar xzf $1              ;;
         *.zip)      unzip $1                ;;
         *.Z)     	 uncompress $1           ;;
         *)    echo "'$1' cannot be extracted via extract()"   ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/Users/thor/perl5";
export PERL_MB_OPT="--install_base /Users/thor/perl5";
export PERL_MM_OPT="INSTALL_BASE=/Users/thor/perl5";
export PERL5LIB="/Users/thor/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/thor/perl5/bin:$PATH";
