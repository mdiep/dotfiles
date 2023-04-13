
setopt PROMPT_SUBST
# %B turns on bold text; %b turns it off
# ${(%):-%~} will have the current path
# ${…:s/…/…/} does a substitution over (1)
export PROMPT='%F{cyan}${${(%):-%~}:s/~\/Repositories\//%{🛠%1G%\}  /} %F{green}»%f '
# Set continuation lines to »
export PS2="%F{green}»%f "

export EDITOR=/usr/bin/vim

# color `ls`
alias "ls"="ls -G"
export LSCOLORS="gxfxcxdxbxegedabagacad"

# zmv
autoload -U zmv
alias "zmv"="noglob zmv -W"


path=(~/bin $path $HOME/.cabal/bin $HOME/.cargo/bin $HOME/.local/bin $HOME/.ghcup/bin /opt/homebrew/bin/)

# Configure FZF (fuzzy finder) to generate the list of files with `ag`
# This filters out ignored files and .git files. Manually exclude Carthage dependendies.
export FZF_DEFAULT_COMMAND='ag -g . --ignore Carthage/Checkouts --ignore Carthage/Build --ignore .git/ --hidden'

# Add alias for `thefuck`, a tool to rerun the last command but fix an issue.
# (e.g. adding `-p` to `mkdir` if you forgot it.)
eval $(thefuck --alias gah)

eval "$(atuin init zsh)"
