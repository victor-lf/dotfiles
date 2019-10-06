# The following lines were added by compinstall
zstyle :compinstall filename '/home/victor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# powerline
powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

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
