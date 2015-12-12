import random
from datetime import datetime

peeps = ['alex', 'brian', 'erica', 'brandon', 'olessa', 'chris', 'sarah', 'charlie']
peeps_dict = {}
for i in peeps:
	peeps_dict[i] = random.random()

print peeps_dict

picks_dict = {}

def matching(person):
	# import dictionaries that will be called or added to
	global peeps_dict
	global picks_dict

	# pull a number out of a hat
	hat_pull = random.random()

	# see which person in peeps_dict has been assigned a number closest to the 
	# out of the hat
	diff = float('inf')
	for key, value in peeps_dict.items():
		if diff > abs(hat_pull - value):
			diff = abs(hat_pull - value)
			match = key
	# if at end of peeps list, and possiblities are forbiden, just start over
	if match in picks_dict.values() and peeps.index(person) >= len(peeps) - 1:
		go()
	# see if person matched has already been matched to someone else
	elif match in picks_dict.values():
		matching(person)
	# finally assign match
	else: 
		picks_dict[person] = match
	return picks_dict

def checking(person):
	# import dictionaries that will be called
	global picks_dict
	global santa
	# get the index number of the person, i, being tested
	peeps_index = peeps.index(person)
	# check if pick is self, if so delete pick and do over
	if picks_dict[person] == peeps[peeps_index]:
		del picks_dict[person]
		matching(person)
		checking(person)
	# picks can't be significant other, and order of list allows discriminating
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
	# check that two people aren't each other's picks - we want a loop
	elif picks_dict[person] == picks_dict[picks_dict[person]]:
		del picks_dict[person]
		matching(person)
		checking(person)
	# once santa list is complete, make sure that nobody has same pick for elf as for santa
	elif picks_dict[person] == santa[person]:
		go()
	else:
		pass

def go():
	# print datetime.now()
	global peeps
	global picks_dict 
	picks_dict = {}
	for i in peeps:
		matching(i)
		checking(i)
	return picks_dict

go()
santa = picks_dict
print 'Santa list: %r' % santa
picks_dict = {}
go()
elf = picks_dict
print 'Elf list: %r' % elf

# email the results by person
# def send_email(user, pwd, recipient, subject, body):
#     import smtplib

#     gmail_user = user
#     gmail_pwd = pwd
#     FROM = user
#     TO = recipient if type(recipient) is list else [recipient]
#     SUBJECT = subject
#     TEXT = body

#     # Prepare actual message
#     message = """\From: %s\nTo: %s\nSubject: %s\n\n%s
#     """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
#     try:
#         server = smtplib.SMTP("smtp.gmail.com", 587)
#         server.ehlo()
#         server.starttls()
#         server.login(gmail_user, gmail_pwd)
#         server.sendmail(FROM, TO, message)
#         server.close()
#         print 'successfully sent the mail'
#     except:
#         print "failed to send mail"

# peeps_addy_dict = {'jones': 'jones.christopherd@gmail.com', 'cdj': 'cdj314@gmail.com', 'jonesc': 'jonesc@colorado.edu'}


# for i in addys:
# 	send_email('jones.christopherd@gmail.com', '###########', peeps_addy_dict[i], 'Gift Exchange!', 'hello and more %s' % other_dict[i])

