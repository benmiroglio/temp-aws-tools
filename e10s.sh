set -e



echo "Updating E10s Repo..."
# clone repos to /mnt
cd $HOME/analyses/e10s_analyses/
git pull origin master

week=$(cat ./multi/meta/last.json | python -c "import sys, json; print json.load(sys.stdin)['week']")
start=$(cat ./multi/meta/last.json | python -c "import sys, json; print json.load(sys.stdin)['start']")
end=$(cat ./multi/meta/last.json | python -c "import sys, json; print json.load(sys.stdin)['end']")


echo "Running job for $week over the following range: $start-$end"

echo "Cloning telemetry-batch-view..."
rm -rf /mnt/telemetry-batch-view/
cd /mnt/
git clone https://github.com/benmiroglio/telemetry-batch-view.git

echo "Updating temp-aws-tools Repo..."
cd $HOME/analyses/temp-aws-tools
git pull origin master
# update e10s script
# (handles edge case for JNothing Error and grabs the submission field)
cat $HOME/analyses/temp-aws-tools/E10sExperiment.scala > /mnt/telemetry-batch-view/src/main/scala/com/mozilla/telemetry/views/E10sExperiment.scala

echo "Building scala code..."

# build code
cd /mnt/telemetry-batch-view && sbt assembly

echo "Running scala job..."
# submit ETL job
spark-submit\
    --master yarn\
    --deploy-mode client\
    --class com.mozilla.telemetry.views.E10sExperimentView\
    target/scala-2.11/telemetry-batch-view-1.1.jar\
    --from $start\
    --to $end\
    --channel beta\
    --version 54.0\
    --experiment multi-webExtensions-beta54-cohorts\
    --bucket telemetry-parquet





echo CONFIGURING ANALYSIS FOR $week
cd $HOME/analyses/e10s_analyses/multi/beta/54/

rm -rf $week
mkdir $week



cp $HOME/analyses/e10s_analyses/multi/meta/e10sMulti_experiment.ipynb $week/
cd $week

echo "Running notebook in the following directory:"
pwd

# insert new date range into notebook
echo "Updating date range in notebook..."
python $HOME/analyses/temp-aws-tools/insert_range.py $start $end

echo "Running notebook and converting to HTML..."
# run noteook and render to html
time env $environment \
PYSPARK_DRIVER_PYTHON=jupyter
PYSPARK_DRIVER_PYTHON_OPTS="nbconvert --ExecutePreprocessor.kernel_name=python2 --ExecutePreprocessor.timeout=-1 --log-level=10 --execute e10sMulti_experiment.ipynb --to html --output-dir ./html/" \
pyspark


MULTI_DIR="~/analyses/e10s_analyses/multi"


echo "Generating RMD File and pushing to S3...RMD will be rendered on dashboard1..."
python $HOME/analyses/temp-aws-tools/generate_report.py $week
cp -r $MULTI_DIR/beta/54/$week $HOME/e10s_report/
aws s3 cp --recursive $HOME/e10s_report/ s3://telemetry-test-bucket/bmiroglio/multi-report/







