# -*- mode: sh -*-
# vi: set ft=sh :

alias vi='vim'
alias cd='pushd > /dev/null'
alias bd='popd > /dev/null'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias tmux='tmux -2'

eval "$(dircolors -b ~/.config/dircolors-solarized/dircolors.ansi-universal)"

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias l='ls $LS_OPTIONS -Flh'
alias la='ls $LS_OPTIONS -FAlh'
alias grep='grep $LS_OPTIONS'

export EDITOR=/usr/bin/vim
eval "$(direnv hook bash)"

export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"
