
setopt PROMPT_SUBST
# %B turns on bold text; %b turns it off
# ${(%):-%~} will have the current path
# ${…:s/…/…/} does a substitution over (1)
export PROMPT='%F{cyan}${${(%):-%~}:s/~\/Repositories\//🛠  /} %F{green}»%f '
# Set continuation lines to »
export PS2="%F{green}»%f "

export EDITOR=/usr/bin/vim

# color `ls`
alias "ls"="ls -G"
export LSCOLORS="gxfxcxdxbxegedabagacad"

# zmv
autoload -U zmv
alias "zmv"="noglob zmv -W"


path=(~/bin $path $HOME/.cabal/bin $HOME/.local/bin)
