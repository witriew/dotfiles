# Inspired heavily from @compnerd (Saleem Abdulrasool)
case $TERM in
  rxvt | xterm | xterm-color | screen* | linux | xterm-256color)
	xterm_prompt=1
	#PROMPT=$'%{\e[01;36m%}[%n]:[%U%l%u%{\e[01;36m%}] %{\e[0m%}%# '
	PROMPT=$'%{\e[00;36m%}[%n]:[%m] %{\e[0m%}%(?..%{\e[00;31m%})%# %{\e[0m%}'
	#RPROMPT=$'%{\e[01;33m%}%m %{\e[01;32m%}%1~%{\e[0m%}'
	RPROMPT=$'%{\e[00;32m%}%~ %{\e[00;33m%}%*%{\e[00;00m%}'
	;;
esac

if [[ $UNAME == 'Linux' ]] {
  alias ls='ls --color=auto -F'
} elif [[ $UNAME == 'Darwin' ]] {
  alias ls='ls -FG'
}

# ZSH aliases
alias grep='grep --color=auto'

# ZSH Options
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY

unsetopt HIST_BEEP
unsetopt EXTENDED_HISTORY

autoload -U colors; colors
autoload -U compinit; compinit
autoload -U promptinit; promptinit

zmodload zsh/complist
zmodload zsh/termcap

zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:jobs' numbers true

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' sort false
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:*:killall:*' menu yes select

zstyle ':completion:*' completer _expand _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:predict:*' completer _complete
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct

zstyle ':completion::complete:*' '\\'
#'
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d -- \e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found -- \e[0m'

zstyle ':completion:*' use-compctl true

#zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:ls:*' ignore-line yes
zstyle ':completion:*:scp:*' ignore-line yes
zstyle ':completion:*:diff:*' ignore-line yes

watch=( all )

trap clear 0

set -o emacs

