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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

export EDITOR=nvim
