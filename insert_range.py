import json
import sys
import re
import datetime as dt

def check_params():
    assert len(sys.argv) == 3, "must specific start and end dates"
    assert len(sys.argv[1]) == len(sys.argv[2]) == 8, "invalid start or end date"
    return sys.argv[1], sys.argv[2]

def edit_notebook(start, end):
    with open('e10sMulti_experiment.ipynb') as f:
        notebook = json.loads(f.read())

    for i in range(len(notebook['cells'])):
        cell = notebook['cells'][i]
        src = cell['source']
        if len(src) > 0:
            if "RANGE" in src[0]:
                insert = "RANGE = " + '"v' + '_'.join([start, end]) + '"\n'
                print "inserting the following line: {}".format(insert)
                notebook['cells'][i]['source'][0] = insert
    with open('e10sMulti_experiment.ipynb', 'w') as output:
        json.dump(notebook, output)


def update_params():
    path = '/home/hadoop/analyses/e10s_analyses/multi/meta/last.json'
    with open(path) as f:
        jobj = json.load(f)
        jobj['week'] = 'week' + str(int(re.sub('[a-z]', '',  jobj['week'])) + 1)
        jobj['start'] = jobj['end']
        jobj['end'] = dt.datetime.strftime(
                                dt.datetime.strptime(jobj['end'], '%Y%m%d') + dt.timedelta(days=7), "%Y%m%d")
    with open(path, 'w') as out:
        json.dump(jobj, out)


if __name__ == "__main__":
    START, END = check_params()
    #update_params()
    edit_notebook(START, END)
    
