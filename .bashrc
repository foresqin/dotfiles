case $- in
    *i*) ;;
      *) return;;
esac

GPG_TTY=`tty`
export GPG_TTY

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10101
HISTFILESIZE=20202

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_funcs ] && .  ~/.bash_funcs

export EDITOR=/usr/bin/vim

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

if [[ -z "$TMUX" ]] ; then
	ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"
	if [[ -z "$ID" ]] ; then
		tmux new-session
	else
		tmux attach-session -t "$ID"
	fi
fi
