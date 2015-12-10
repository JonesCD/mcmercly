import random

peeps = ['alex', 'brian', 'erica', 'brandon', 'olessa', 'chris', 'sarah', 'charlie']
peeps_dict = {}
for i in peeps:
	peeps_dict[i] = random.random()

print peeps_dict

picks_dict = {}

def matching(person):
	global peeps_dict
	global picks_dict
	hat_pull = random.random()

	diff = float('inf')
	for key, value in peeps_dict.items():
		if diff > abs(hat_pull - value):
			diff = abs(hat_pull - value)	

			match = key
	picks_dict[key] = match
	return picks_dict

def checking(person):
	global picks_dict
	if picks_dict[person] == peeps_dict[person]:
		matching(person)

for i in peeps:
	matching(i)
	print picks_dict
	# checking(i)

print picks_dict
