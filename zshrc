source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/cp
  zgen oh-my-zsh plugins/history
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/ruby
  zgen oh-my-zsh plugins/ssh-agent

  zgen oh-my-zsh themes/steeef

  zgen load chrissicool/zsh-256color
  zgen load joel-porquet/zsh-dircolors-solarized
  zgen load rimraf/k
  zgen load horosgrisa/mysql-colorize

  # Have to be last
  zgen load willghatch/zsh-cdr
  zgen load zsh-users/zaw

  zgen save
fi


if [[ -e ~/.zsh_local ]]; then
    source ~/.zsh_local
fi
