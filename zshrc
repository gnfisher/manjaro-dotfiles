# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/greg/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PATH=$HOME/.bin:/usr/local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
export PS1='%B%~%b %# '

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

# Make directory and change into it.
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# Load .env file into shell session for environment variables
function envup() {
  if [ -f .env ]; then
    export $(sed '/^ *#/ d' .env)
  else
    echo 'No .env file found' 1>&2
    return 1
  fi
}

# Aliases
alias tas="tmux -2 attach-session -t"
alias rs="bin/rails"
alias ra="bin/rake"
alias sp="bin/rspec"
alias gbc="git branch | cat"
alias vimrc="vim ~/.dotfiles/vimrc"
alias migrate="bin/rails db:migrate db:rollback && bin/rails db:migrate db:test:prepare"
