import json
import sys

def check_params():
    assert len(sys.argv) == 3, "must specific start and end dates"
    assert len(sys.argv[1]) == len(sys.argv[2]) == 8, "invalid start or end date"
    return sys.argv[1], sys.argv[2]

def edit_notebook(start, end):
    with open('test.ipynb') as f:
        notebook = json.loads(f.read())

    for i in range(len(notebook['cells'])):
        cell = notebook['cells'][i]
        src = cell['source']
        if len(src) > 0:
            if "RANGE" in src[0]:
                notebook['cells'][i]['source'][0] = "RANGE = " + '"v' + '_'.join([start, end]) + '"'
    with open('test.ipynb', 'w') as output:
        json.dump(notebook, output)

if __name__ == "__main__":
    START, END = check_params()
    edit_notebook(START, END)
    
