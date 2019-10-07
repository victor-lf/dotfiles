#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# set some environment variables
XDG_CONFIG_HOME="$HOME/.config"; export XDG_CONFIG_HOME
PATH=$PATH:/home/victor/.gem/ruby/2.60/bin; export PATH

# autostart X at login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
