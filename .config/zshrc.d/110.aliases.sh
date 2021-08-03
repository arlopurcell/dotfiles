alias ls="exa"
alias ll="exa -lh"
alias la="exa -lha"
alias dotfile="/usr/bin/git --git-dir=$HOME/.config/dotfile --work-tree=$HOME"
alias vim="nvim"
alias ssh="kitty +kitten ssh"

function link_dcdbl () {
  local dcdbl_target="${HOME}/bin"
  local dcdbl_project="${HOME}/github/decodable"

  local dcdbl_rev="$(cd ${dcdbl_project}; git rev-parse --short HEAD)"
  local dcdbl_path="${dcdbl_project}/decodable-cli/build/stage/linux/amd64/decodable-cli-linux-amd64-${dcdbl_rev}/bin/decodable" 
  if [ ! -e "${dcdbl_path}" ]; then
    (cd ${dcdbl_project}/decodable-cli; make)
  fi
  ln -fs "${dcdbl_path}" "${dcdbl_target}/dcdbl_latest"
}

alias dcdbl="link_dcdbl && dcdbl_latest"
