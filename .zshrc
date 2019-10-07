# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/victor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# set some aliases
alias ls='ls --color=auto'

# powerline
#powerline-daemon -q
#. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# neofetch
neofetch

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Powerlevel9k theme
#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# enable spell check and autocorrection
setopt correct

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install
