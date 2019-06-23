# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/greg/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PATH=$HOME/bin:/usr/local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
export PS1='%B%~%b %# '

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

alias tas="tmux -2 attach-session -t"
alias rs="bin/rails"
alias ra="bin/rake"
alias sp="bin/rspec"
alias gbc="git branch | cat"
alias vimrc="vim ~/.dotfiles/vimrc"
alias migrate="bin/rails db:migrate db:rollback && bin/rails db:migrate db:test:prepare"
