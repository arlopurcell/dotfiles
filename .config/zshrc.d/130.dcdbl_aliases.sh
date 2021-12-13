function tag_or_sha() {
  # The git sha
  local sha=$(git rev-parse --short HEAD)
  # If there is no tag specified, we take the *first* tag on this sha as our official version.
  local package_name="$(basename $(pwd))"
  local tag=$(git tag --points-at ${sha} | sed -ne "s/^${package_name}-v//p" | head -n 1)

  # If there is still no tag, use the sha itself.
  if [ -n "${tag}" ]; then
    echo "${tag}" 
  else
    echo "${sha}"
  fi
}

function link_dcdbl () {
  # Configure: Directory on your PATH
  local dcdbl_target="${HOME}/bin"

  # Configure: location of decodable git repo
  local dcdbl_project="${HOME}/github/decodable/decodable"

  local dcdbl_tag="$(cd ${dcdbl_project}/decodable-cli; tag_or_sha)"

  local go_os=$(go env GOOS)
  local go_arch=$(go env GOARCH)
  local dcdbl_path="${dcdbl_project}/decodable-cli/build/stage/${go_os}/${go_arch}/decodable-cli-${go_os}-${go_arch}-${dcdbl_tag}/bin/decodable" 
  if [ ! -e "${dcdbl_path}" ]; then
    (cd ${dcdbl_project}/decodable-cli; make)
  fi
  ln -fs "${dcdbl_path}" "${dcdbl_target}/dcdbl_latest"
}

alias d="link_dcdbl && dcdbl_latest"

function kafka-broker () {
  local kafka_host=$(kubectl get nodes --output 'jsonpath={range .items[*]}{.status.addresses[?(@.type=="InternalIP")].address}{end}')
  local kafka_port=$(kubectl get service --namespace kafka kafka-kafka-external-bootstrap --output 'jsonpath={.spec.ports[0].nodePort}')
  echo "${kafka_host}:${kafka_port}"
}

alias p-fwd-ctrl="kubectl --namespace decodable-cell-local-control port-forward service/api 8080:http"
alias p-fwd-psql="kubectl --namespace default port-forward service/postgres 5432:5432"
alias k="kubectl"
