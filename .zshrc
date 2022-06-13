HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000

unsetopt beep

setopt autocd
alias ls="ls --color -CF"
alias ll="ls -l"
alias la="ls -a"
alias .="pwd"
alias lock="swaylock --screenshots --clock --indicator --effect-blur 7x5 -f"
alias volume="amixer sset Master"
alias pacman-clean='(set -x; doas pacman -Rs $(pacman -Qtdq)'

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n@%{$fg[green]%}%m %{$fg[cyan]%}%~%{$fg[red]%}]%{$reset_color%}$ "

bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select
{
	if [[ ${KEYMAP} == vicmd ]] ||
		 [[ $1 = "block" ]]; then
		echo -ne "\e[1 q"
	elif [[ ${KEYMAP} == main ]]  ||
		   [[ ${KEYMAP} == viins ]] ||
			 [[ ${KEYMAP} == "" ]]    ||
			 [[ $1 = "line" ]]; then
		echo -ne "\e[5 q"
	fi
}
zle -N zle-keymap-select
zle-line-init()
{
	zle -K viins
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne "\e[1 q"
preexec() { echo -ne "\e[1 q" }

autoload -U compinit
zstyle ":completition:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

ufetch
echo ""

[ -f "/home/gabry/.ghcup/env" ] && source "/home/gabry/.ghcup/env" # ghcup-env
export TMPDIR=/home/gabry/.ghcup-tmp
export CHROME_EXECUTABLE=/usr/bin/chromium

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

