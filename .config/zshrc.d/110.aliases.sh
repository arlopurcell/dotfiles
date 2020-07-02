alias ls="exa"
alias dotfile="/usr/bin/git --git-dir=$HOME/.config/dotfile --work-tree=$HOME"
alias vim="nvim"

alias ibw="cd ~/indeed/indexbuilder"
alias ibwd="cd ~/indeed/ibw-spark-daemon"
alias ibwr="cd ~/indeed/ibw-spark-runner"
alias ibwu="cd ~/indeed/ibw-leila-utils"
alias ibwb="cd ~/indeed/ibw-leila-builders"

ibranch() {
   indy branch $1 && indy jira assign
}

icr() {
   mr_id=$(indy gitlab create-mr | tail -n 1)
   group_project=$(git remote get-url origin | sed "s/.*:\(.*\)\.git$/\1/")
   echo "https://code.corp.indeed.com/${group_project}/-/merge_requests/${mr_id}"
}

missingshards() {
    http --headers HEAD https://squall.indeed.com/iql/query "q==from $1 ${2:-yesterday} ${3:-today}" client==iqlwebapp "username==$LDAPUSER" view==1 head==1 | sed -n "s/^IQL-Missing-Shards: \(.*\)/\1/p"
}
