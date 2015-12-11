import random
from datetime import datetime

peeps = ['alex', 'brian', 'erica', 'brandon', 'olessa', 'chris', 'sarah', 'charlie']
peeps_dict = {}
for i in peeps:
	peeps_dict[i] = random.random()

print peeps_dict

picks_dict = {}
cnt = 0

def matching(person):
	global peeps_dict
	global picks_dict
	global cnt

	cnt += 1
	if cnt == 100:
		picks_dict = {}
		cnt = 0
		go()

	hat_pull = random.random()

	diff = float('inf')
	for key, value in peeps_dict.items():
		if diff > abs(hat_pull - value):
			diff = abs(hat_pull - value)
			match = key
	if match in picks_dict.values():
		matching(person)
	else: 
		picks_dict[person] = match
	return picks_dict

def checking(person):
	global picks_dict
	peeps_index = peeps.index(person)
	if picks_dict[person] == peeps[peeps_index]:
		del picks_dict[person]
		matching(person)
		checking(person)
	elif peeps_index % 2 == 0:
		if peeps.index(picks_dict[person]) == peeps_index + 1:
			del picks_dict[person]
			matching(person)
			checking(person)
	elif peeps_index % 2 != 0:
		if peeps.index(picks_dict[person]) == peeps_index - 1:
			del picks_dict[person]
			matching(person)
			checking(person)
	elif picks_dict[person] in picks_dict:
		if picks_dict[person] == picks_dict[picks_dict[person]]:
			del picks_dict[person]
			matching(person)
			checking(person)
		else:
			pass
	else:
		pass

def go():
	print datetime.now()
	global peeps
	for i in peeps:
		matching(i)
		checking(i)
	print picks_dict.items()

go()
