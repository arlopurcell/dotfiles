alias ls="exa"
alias dotfile="/usr/bin/git --git-dir=$HOME/.config/dotfile --work-tree=$HOME"
alias vim="nvim"

alias ibw="cd ~/indeed/indexbuilder"
alias ibwd="cd ~/indeed/ibw-spark-daemon"
alias ibwr="cd ~/indeed/ibw-spark-runner"
alias ibwu="cd ~/indeed/ibw-leila-utils"
alias ibwb="cd ~/indeed/ibw-leila-builders"
alias sqp="cd ~/indeed/spark-queue-processor"
alias ibwe="cd ~/indeed/ibw-expressions"

alias keytab="kinit -kt ~/.keytab/arlo.keytab arlo"

ibranch() {
   indy branch $1 && indy jira assign
}

#ibwcr() {
#   mr_id=$(indy gitlab create-mr --assignees peterh jbelcher jpthangaraj ngekakis | tail -n 1)
#   group_project=$(git remote get-url origin | sed "s/.*:\(.*\)\.git$/\1/")
#   echo "https://code.corp.indeed.com/${group_project}/-/merge_requests/${mr_id}"
#}

icr() {
   mr_id=$(indy gitlab create-mr | tail -n 1)
   group_project=$(git remote get-url origin | sed "s/.*:\(.*\)\.git$/\1/")
   echo "https://code.corp.indeed.com/${group_project}/-/merge_requests/${mr_id}"
}

missingshards() {
    http --headers HEAD https://squall.indeed.com/iql/query "q==from $1 ${2:-yesterday} ${3:-today}" client==iqlwebapp "username==$LDAPUSER" view==1 head==1 | sed -n "s/^IQL-Missing-Shards: \(.*\)/\1/p"
}
alias presto="$HOME/bin/presto-cli --server https://presto.indeed.tech --catalog skipperhive --schema imhotep --debug --krb5-keytab-path $HOME/.keytab/$USER.keytab --krb5-principal $USER --krb5-remote-service-name HTTP --user $USER --krb5-config-path /etc/krb5.conf --krb5-disable-remote-service-hostname-canonicalization
"

alias rcr="rindy push-mr --update-jira 'Pending Review' --use-jira"
alias ibwcr="rindy push-mr --update-jira 'Pending Review' --use-jira --assignee-ids 3071 3076 3239 3215 249"
alias rbr="rindy browse --update-jira 'In Progress' --jql 'assignee is EMPTY AND resolution = unresolved AND project = \$project'"
