import json
import sys
import datetime

def update_range(directory):
    with open(directory + "/last.json") as f:
        date_range = json.load(f)
    start, end = date_range['range'][1:].split('_')
    start = end
    end = datetime.datetime.strftime(
                datetime.datetime.strptime(end, '%Y%m%d') + \
                datetime.timedelta(days=7), '%Y%m%d')
    return start,end

def edit_notebook(start, end):
    with open('e10sMulti_experiment.ipynb') as f:
        notebook = json.loads(f.read())

    for i in range(len(notebook['cells'])):
        cell = notebook['cells'][i]
        src = cell['source']
        if len(src) > 0:
            if "RANGE" in src[0]:
                notebook['cells'][i]['source'][0] = "RANGE = " + '"v' + '_'.join([start, end]) + '"\n'
    with open('e10sMulti_experiment.ipynb', 'w') as output:
        json.dump(notebook, output)

if __name__ == "__main__":
    print 'done'

