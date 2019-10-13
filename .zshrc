# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/victor/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt pure
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install

# vi mode
bindkey -v
export KEYTIMEOUT=1

# set the default prompt theme
prompt pure

# set some aliases
alias ls='ls --color=auto'

# enable spell check and autocorrection
setopt correct

# powerline
#powerline-daemon -q
#. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# neofetch
# neofetch

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# set fzf keybindings and completion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
