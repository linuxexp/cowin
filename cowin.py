#/usr/bin/python

import sys, json, os


def notify(title, text):
    os.system("""
              osascript -e 'display notification "{}" sound name "{}" with title "{}"'
              """.format(text, "Blow", title))

centers = json.load(sys.stdin)['centers']

matched_centers = {}

for center in centers:
	sessions = center['sessions']
	for session in sessions:
		if session['min_age_limit'] == 18 and  session['available_capacity'] != 0:
			matched_centers[center['name']] = center

if bool(matched_centers) == False:
	exit(1)


matches = ""

for name in matched_centers:
	center = matched_centers[name]
	seats = 0
	for session in center['sessions']:
		seats += session['available_capacity']
	matches += "{}-{}-{}".format(center['pincode'], name, seats)

notify('COWIN', matches)