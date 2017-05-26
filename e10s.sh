#!/bin/bash
## The cron job to update the daily reports for the Unified Search v2 study.
## This is meant to be run as a cron from hala1.

set -e

. ~/.bash_profile

TODAY=$(date +%Y-%m-%d)
CLUSTER_JOB_DIR=$HOME
## Time between checks for job completion.
COMPLETION_CHECK_INTERVAL_MINUTES=10
## This file in the current dir contains the cluster ID.
## This filename is shared with the R scripts (for now).
CLUSTER_ID_FILE=e10s-emr

## Patch to load "methods" package when using Rscript.
## It is not loaded by default.
RSCRIPT='Rscript --default-packages=methods,datasets,utils,grDevices,graphics,stats'

## On error, send email notification and exit.
fail() {
    ## Send email notification if there email address is available.
    [[ -n "$SCRIPT_ERROR_EMAIL" && "$SCRIPT_ERROR_EMAIL" =~ "@" ]] && \
        echo "$1" | mailx -s "FAILED: Unified Search daily job" \
            "$SCRIPT_ERROR_EMAIL"
    echo -e "\nScript failed: $1"
    echo "Exiting: `date`."
    exit 1
}

## Outputs for each run are stored in a dir named using the current date.

## Redirect output if required.
exec > cronjob.log 2>&1

## Use mozaws to start a 1-node Spark cluster.
echo -e "\nLaunching Spark cluster: `date`."
R_START_CLUSTER="source('~/mozaws.init.R'); cl <- emr.new(spotnodes=19);"
R_START_CLUSTER="$R_START_CLUSTER cat(cl\$Id, file = '$CLUSTER_ID_FILE');"
$RSCRIPT -e "$R_START_CLUSTER"
[[ $? -ne 0 ]] && fail "Error starting Spark cluster."

## Set the job running on the cluster in a detached tmux session.
CLUSTER_IP_PATH="$HOME/.mozaws.clus/$(cat $CLUSTER_ID_FILE)/dns_name"
CLUSTER_IP=$(cat "$CLUSTER_IP_PATH")
DONE_FILE="$CLUSTER_JOB_DIR/_done"
## Make sure any previous '_done' file is removed.
ssh hadoop@$CLUSTER_IP rm -f $DONE_FILE

echo "SSH'ing into cluster"
REMOTE_CMD=". /etc/profile; bash $HOME/analyses/temp-aws-tools/e10s.sh > notebookrun.log 2>&1"
ssh "hadoop@$CLUSTER_IP" "tmux new -d '$REMOTE_CMD'"

## Periodically check for completion, indicated by the presence of the file '_done'.
NUM_TRIES=0
while ( ! ssh hadoop@$CLUSTER_IP test -e $DONE_FILE && [[ $NUM_TRIES -lt 40 ]] ); do
    echo "Checking $NUM_TRIES..." 
    NUM_TRIES=$((NUM_TRIES+1))
    sleep "${COMPLETION_CHECK_INTERVAL_MINUTES}m"
done
## Remove the '_done' file.
ssh $CLUSTER_IP rm $DONE_FILE


## Use mozaws to kill the cluster.
echo "Killing Spark cluster: `date`."
R_KILL_CLUSTER="source('~/mozaws.init.R'); clusId <- readLines('$CLUSTER_ID_FILE', n = 1);"
R_KILL_CLUSTER="$R_KILL_CLUSTER cl <- as.awsCluster(clusId); emr.kill(cl);"
$RSCRIPT -e "$R_KILL_CLUSTER"
[[ $? -ne 0 ]] && fail "Error killing Spark cluster."


echo "Job was Successful :)"

