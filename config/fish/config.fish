# Functions for ifs
[ -e /Users/ ]; and set osx true
function osx
	true $argv
end;

[ -e ~/.config/fish/machine.fish ]; and set machine true
function machine
	true $argv
end;

# End functions for ifs

if osx 
	#if it's OS X we want Textmate to be the default editor
	set EDITOR mate -w
else
	set EDITOR vim
end;

set LS_OPTIONS "--color=auto"

function fish_title
	whoami
	echo ': {' $_ '} '
	pwd
end;

# Magic extract command
function extract
	if test -f $argv[1]
		switch $argv[1]
			case *.tar.bz2
				tar xjf $argv[1]
				return 0
			case *.tar.gz
				tar xzf $argv[1]
				return 0
			case *.bz2
				bunzip2 $argv[1]
				return 0
			case *.rar
				rar x $argv[1]
				return 0
			case *.gz
				gunzip $argv[1]
				return 0
			case *.tar
				tar xf $argv[1]
				return 0
			case *.tbz2
				tar xjf $argv[1]
				return 0
			case *.tgz
				tar xzf $argv[1]
				return 0
			case *.zip
				unzip $argv[1]
				return 0
			case *.Z
				uncompress $argv[1]
				return 0
			case *
				echo "$argv[1] can not be extracted using extract"
				return 1
		end;
	else
		echo "$argv[1] is not a valid file"
		return 1
	end;
	return 0
end;

function rmhost
	echo "Removing host on line $argv"
	if osx
		# When I use OSX I want gnu sed
		gsed -i "$argv"d ~/.ssh/known_hosts
	else
	    sed -i "$argv"d ~/.ssh/known_hosts
	end;
	echo "Removed host on line $argv"
end;

function psgrep
	ps aux | grep $argv | grep -v grep
end;

# Magic command to add macaddress to allowed list!

function addmacaddr
	ssh 10.0.0.3 "/interface wireless access-list add forwarding=no authentication=yes interface=wlan1 mac-address=$argv"
end;	

# git prompt

set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  if test -d .git 
    printf '%s@%s %s%s%s:%s(%s)> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch) (echo $status)
  else
    printf '%s@%s %s%s%s(%s)> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (echo $status)
  end
end

# end git prompt

if osx
	# on OSX we like gnu ls!
	alias ls "gls $LS_OPTIONS -hF"
	alias ll "gls $LS_OPTIONS -lhF"
	alias l "gls $LS_OPTIONS -lAhF"
else
	alias ls "ls $LS_OPTIONS -hF"
	alias ll "ls $LS_OPTIONS -lhF"
	alias l "ls $LS_OPTIONS -lAhF"
end;

alias cd.. "cd .."
alias c "clear"
alias e "exit"
alias .. "cd .."

# Import machine specific configs

if machine
	. ~/.config/fish/machine.fish
end;
