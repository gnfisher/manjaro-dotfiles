# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/greg/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PATH=$HOME/bin:/usr/local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
