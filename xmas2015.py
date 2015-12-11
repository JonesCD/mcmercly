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

def send_email(user, pwd, recipient, subject, body):
    import smtplib

    gmail_user = user
    gmail_pwd = pwd
    FROM = user
    TO = recipient if type(recipient) is list else [recipient]
    SUBJECT = subject
    TEXT = body

    # Prepare actual message
    message = """\From: %s\nTo: %s\nSubject: %s\n\n%s
    """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.ehlo()
        server.starttls()
        server.login(gmail_user, gmail_pwd)
        server.sendmail(FROM, TO, message)
        server.close()
        print 'successfully sent the mail'
    except:
        print "failed to send mail"

addys = ['jones', 'cdj', 'jonesc']
addy_dict = {'jones': 'jones.christopherd@gmail.com', 'cdj': 'cdj314@gmail.com', 'jonesc': 'jonesc@colorado.edu'}
other_dict = {'jones': 'bah', 'jonesc': 'nom', 'cdj':'sou'}


for i in addys:
	send_email('jones.christopherd@gmail.com', '###########', addy_dict[i], 'perfect test', 'hello and more %s' % other_dict[i])
