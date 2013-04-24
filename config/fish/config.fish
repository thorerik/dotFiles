[ -e /Users/ ]; and set osx true


if osx
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

function rmhost
	echo "Removing host on line $argv"
	if osx
		gsed -i $argvd ~/.ssh/known_hosts
	else
	    sed -i $argvd ~/.ssh/known_hosts
	end;
	echo "Removed host on line $argv"
end;

function psgrep
	ps aux | grep $argv | grep -v grep
end;

# Magic command to add macaddress to allowed list!

function addmacaddr
	ssh admin@192.168.88.1 "/interface wireless access-list add forwarding=no authentication=yes interface=wlan1 mac-address=$argv"
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
    printf '%s@%s %s%s%s:%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end

# end git prompt

if osx
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

. ~/.config/fish/machine.fish
