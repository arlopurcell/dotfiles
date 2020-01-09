# disable horrific ctrl sequences
stty -ixon 

bindkey -e
bindkey "^U" backward-kill-line

DEFAULT_USER=`whoami`

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias ls="exa"
alias dotfile="/usr/bin/git --git-dir=$HOME/.config/dotfile/repo --work-tree=$HOME"
alias vim="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

