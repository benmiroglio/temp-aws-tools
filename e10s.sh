week="$1"
start="$2"
end="$3"

# echo "CLONING REPOS"
# # clone repos to /mnt
# cd /mnt && git clone https://github.com/mozilla/telemetry-batch-view.git && git clone https://github.com/benmiroglio/temp-aws-tools.git

# # update e10s script
# # (handles edge case for JNothing Error and grabs the submission field)
# cat temp-aws-tools/E10sExperiment.scala > telemetry-batch-view/src/main/scala/com/mozilla/telemetry/views/E10sExperiment.scala

# echo BUILDING SCALA CODE

# # build code
# cd telemetry-batch-view && sbt assembly

# # open screen process (crl A+D to return)
# screen 


# echo RUNNING ETL
# # submit ETL job
# spark-submit\
#     --master yarn\
#     --deploy-mode client\
#     --class com.mozilla.telemetry.views.E10sExperimentView\
#     target/scala-2.11/telemetry-batch-view-1.1.jar\
#     --from $start\
#     --to $end\
#     --channel beta\
#     --version 54.0\
#     --experiment multi-webExtensions-beta54-cohorts\
#     --bucket telemetry-parquet


echo CONFIGURING ANALYSIS FOR $week
cd /home/hadoop/analyses/e10s_analyses/multi/beta/54
mkdir $week

# get the previous week name
prev=week$(($week - 1))
echo Copying notebook from $prev...


cp $prev/e10sMulti_experiment.ipynb $week/
cd $week

# insert new date range into notebook
python /mnt/temp-aws-tools/insert_range.py $start $end

echo RUNNING NOTEBOOK
# run noteook and render to html
jupyter nbconvert \
    --ExecutePreprocessor.kernel_name=python2\
    --ExecutePreprocessor.timeout=-1\
    --log-level=10\
    --execute e10sMulti_experiment.ipynb\
    --to html\
    --output-dir ./html/

# copy html files to s3
aws s3 cp --recursive ./html s3://telemetry-test-bucket/e10s_experiment_view/multi_webExtensions_beta54_cohorts/$week-html






