# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  prompt_segment_raw $(raw_color $1) $(raw_color $2) $3
}

prompt_segment_raw() {
  local bg fg
  [[ -n $1 ]] && bg="$BG[$(raw_color $1)]" || bg="%{%k%}"
  [[ -n $2 ]] && fg="$FG[$(raw_color $2)]" || fg="%{%f%}"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " $bg$FG[$CURRENT_BG]$SEGMENT_SEPARATOR$fg "
  else
    echo -n "$bg$fg "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

raw_color() {
  case $1 in
    [0-9][0-9][0-9])
      echo -n $1;;
    black)
      echo -n "000";;
    red)
      echo -n "001";;
    green)
      echo -n "002";;
    yellow)
      echo -n "003";;
    blue)
      echo -n "004";;
    magenta)
      echo -n "005";;
    cyan)
      echo -n "006";;
    white)
      echo -n "007";;
    *)
      echo "Invalid color name: $1" 1>&2
  esac
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%}$FG[$CURRENT_BG]$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
} 

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment "013" "000" "$USER@%m"
  fi
}

# Dir: current working directory
prompt_dir() {
  dir=$(pwd | sed "s|$HOME|~|" | sed "s|/\(.*\)*/\([^/]*\)/\([^/]*\)$|/…/\2/\3|")
  prompt_segment blue black "$dir"
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment black white "🐍"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black white "$symbols"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_end
}

setopt prompt_subst # enable command substition in prompt

PROMPT='%{%f%b%k%}$(build_prompt) '
RPROMPT='' # no initial prompt, set dynamically

ASYNC_PROC=0
# Set git info in RPROMPT asynchronously to avoid waiting for slow git operations (especially on macOS)
function async_git_prompt() {

    # This function runs in the backround and fires a USR1 signal when it's finished calculating the git prompt
    function async() {
        update_current_git_vars
        # save to temp file
        printf "%s" "$(git_super_status)" > "${HOME}/.zsh_tmp_prompt"

        # signal parent
        kill -s USR1 $$
    }

    # do not clear RPROMPT, let it persist

    # kill child if necessary
    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi

    RPROMPT="%F{yellow}%*%{$reset_color%}"

    # start background computation
    async &!
    ASYNC_PROC=$!
}

precmd_functions+=(async_git_prompt)

# Catch the USR1 signal fired above and set RPROMPT accordingly
function TRAPUSR1() {
    # read from temp file
    RPROMPT="$RPROMPT $(cat ${HOME}/.zsh_tmp_prompt)"

    # reset proc number
    ASYNC_PROC=0

    # redisplay
    zle && zle reset-prompt
}

