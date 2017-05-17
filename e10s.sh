set -e

week="$1"
start="$2"
end="$3"

echo "CLONING REPOS"
# clone repos to /mnt
cd /mnt
git clone https://github.com/mozilla/telemetry-batch-view.git
git clone https://github.com/benmiroglio/temp-aws-tools.git
git clone https://github.com/benmiroglio/e10s_analyses.git 

# # update e10s script
# # (handles edge case for JNothing Error and grabs the submission field)
# cat temp-aws-tools/E10sExperiment.scala > telemetry-batch-view/src/main/scala/com/mozilla/telemetry/views/E10sExperiment.scala

# echo BUILDING SCALA CODE

# # build code
# cd telemetry-batch-view && sbt assembly



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
cd /mnt/e10s_analyses/multi/beta/54
mkdir $week

# get the previous week name
prev=$((${week//[!0-9]/} - 1))
echo Copying notebook from week$prev...


cp week$prev/e10sMulti_experiment.ipynb $week/
cd $week
pwd

# insert new date range into notebook
python /mnt/temp-aws-tools/insert_range.py $start $end

echo RUNNING NOTEBOOK
# run noteook and render to html
time env $environment \
PYSPARK_DRIVER_PYTHON=jupyter
PYSPARK_DRIVER_PYTHON_OPTS="nbconvert --ExecutePreprocessor.kernel_name=python2 --ExecutePreprocessor.timeout=-1 --log-level=10 --execute e10sMulti_experiment.ipynb --to html --output-dir ./html/" \
pyspark


aws s3 cp --recursive s3://telemetry-test-bucket/bmiroglio/multi-report/ /mnt

cd /mnt/e10s_analyses/multi/beta/54/$week
mkdir /mnt/data/$week
mv html /mnt/data/$week/
cd /mnt
python /mnt/temp-aws-tools/generate_report.py $week

aws s3 cp --recursive /mnt/data s3://telemetry-test-bucket/bmiroglio/multi-report






