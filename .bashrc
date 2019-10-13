#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# vi mode
set -o vi

# set fzf keybindings and completion
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
