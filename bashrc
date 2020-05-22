#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll="ls -l"
PS1='[\u@\h \W]\$ '
export EDITOR="vim"
calc(){
        echo "scale=2;$*" | bc -l
}
