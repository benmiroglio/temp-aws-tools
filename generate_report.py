import sys
import re
import os

target_week = int(re.sub('[a-z]', '', sys.argv[1]))
weeks = ['week' + str(i) for i in range(1, target_week+1)][::-1]
print 


def get_text(filename):
	with open(filename) as f:
		return f.read()

def write_to_file(contents, filename):
	with open(filename, 'w') as out:
		out.write(contents)

def probe_header():
	return '''
		<link rel="stylesheet" type="text/css" href="../notebook.css">
		<body>
	
		<div class="cell border-box-sizing text_cell rendered">
		<div class="prompt input_prompt">
		</div>
		<div class="inner_cell">
		<div class="text_cell_render border-box-sizing rendered_html">
	'''


def any_keywords(line):
	lst = ["Wrangling", "<hr>", "MemoryUsage", "TabSwitching", "SlowScripts"]
	return any([i in line for i in lst])


def reformat_report(filename, directory):
	os.system("mkdir data/{} && mv e10sMuti* data/{}/".format('week' + str(target_week)))
	path = '/'.join([directory, filename])
	with open(path) as f:
		current_html = ''
		current_probe = None
		first = True
		for line in f:
			if first and '<h1 id="Results">' in line:
				first = False
				write_to_file(current_html, '/'.join([directory, 'summary.html']))
			if first:
				current_html += line
				continue
			if line[:3] == '<h3':
				print current_probe
				if current_probe:
				  write_to_file(current_html, '/'.join([directory, current_probe + '.html']))
				current_probe = line.split('=')[1].split('>')[0].strip('"')
				current_html = probe_header()
			elif any_keywords(line) and current_probe:
				write_to_file(current_html, '/'.join([directory, current_probe + '.html']))

			else:
				current_html +=  line 
				



with open('multi-new.Rmd', 'w') as new_report:
	header =  get_text("/mnt/temp-aws-tools/header-markdown-template.md")
	new_report.write(header)
	for week in weeks:
		reformat_report('e10sMulti_experiment.html', 'data/{}'.format(week))
		week_body = re.sub("{}", week, get_text("/mnt/temp-aws-tools/weekx-markdown-template.md"))
		new_report.write(week_body)


print "Done"


	
