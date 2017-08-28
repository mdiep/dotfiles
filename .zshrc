
export PROMPT="%B%~ » %b"
export PS2="» "
export EDITOR=/usr/bin/vim

# color `ls`
alias "ls"="ls -G"
export LSCOLORS="gxfxcxdxbxegedabagacad"

# zmv
autoload -U zmv
alias "zmv"="noglob zmv -W"


path=(~/bin $path $HOME/.cabal/bin $HOME/.local/bin)
