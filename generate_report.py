import sys
import re
import os

week = 'week3'


def get_text(filename):
	with open(filename) as f:
		return f.read()

def write_to_file(contents, filename):
	with open(filename, 'w') as out:
		out.write(contents)

def split_tabs(html, fileprefix):
	current_html = ''
	for line in html.split('\n'):
		if "1-3 Tabs" in line:
			current_html = ''
		elif "4+ Tabs" in line:
			write_to_file(current_html, fileprefix + '1-3Tabs.html')
			current_html = ''
		else:
			current_html += line + '\n'

	write_to_file(current_html, fileprefix + '4+-Tabs.html')

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
				  split_tabs(current_html, '/'.join([directory, current_probe]))
				current_probe = line.split('=')[1].split('>')[0].strip('"')
				current_html = ''
			elif any_keywords(line) and current_probe:
				split_tabs(current_html, '/'.join([directory, current_probe]))

			else:
				current_html += line 
				


reformat_report('e10sMulti_experiment.html', '%s/html' % week)
with open('mutli-new.Rmd') as current_report:
	with open('multi-new-temp.Rmd', 'w') as new_report:
		i = 1
		for line in current_report:
			new_report.write(line)
			if i == 10:
				week_body = re.sub("{}", week, get_text("/src/temp-aws-tools/weekx-markdown-template.md"))
				new_report.write(week_body)

print "Done"



	
