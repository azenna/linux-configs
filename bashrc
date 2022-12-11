# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

eval "$(starship init bash)"
alias battery='cat /sys/class/power_supply/BAT0/capacity'
export DISPLAY=:0

