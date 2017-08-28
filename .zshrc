
setopt PROMPT_SUBST
# %B turns on bold text; %b turns it off
# ${(%):-%~} will have the current path
# ${…:s/…/…/} does a substitution over (1)
export PROMPT='%B${${(%):-%~}:s/~\/Repositories\//🛠  /} » %b'
# Set continuation lines to »
export PS2="» "

export EDITOR=/usr/bin/vim

# color `ls`
alias "ls"="ls -G"
export LSCOLORS="gxfxcxdxbxegedabagacad"

# zmv
autoload -U zmv
alias "zmv"="noglob zmv -W"


path=(~/bin $path $HOME/.cabal/bin $HOME/.local/bin)
