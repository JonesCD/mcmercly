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
# print 'Santa list: %r' % santa
picks_dict = {}
go()
elf = picks_dict
# print 'Elf list: %r' % elf

# email the results by person
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

peeps_addy_dict = {'chris': 'jones.christopherd@gmail.com', 'olessa': '@gmail.com', 'alex': '@gmail.com', 'charlie': '@gmail.com', 'brandon': '@gmail.com', 'erica': '@hotmail.com', 'sarah': '@gmail.com', 'brian':'@gmail.com'}

msg = "Hello, member of the Fun Crowd (%s)! We are having a group gift exchange. A Secret Santa. You've been assigned two people to get a gift for. They may or may not be the same person, but you can be assured that they won't be: 1) your spouse, or 2) the same person that's getting something for you. The possibility that they may be the same person is a bug. I can't fix it. I don't have the skill. Don't be a jerk about it. If you get the same person, that does not mean you can just combine the two gifts. Anyway, you're 'Santa' to someone. That means you shall not spend more than $12.50 in buying/crafting/baking/shipping them a gift (your time has no value here - accept that). You're also an 'Elf' to someone. That means you shall not spend more than $2.50 on that person. There is a BIG PRIZE for getting as close as possible to those limits, and a HUGE PENALTY for exceeding. Do your best. Be sincere/funny/creative/unexpected/thoughtful. Heck, go off piste, and be gross if you want. Your identity is secure, due to computer technology. You are Santa to %s, and you are an Elf to %s. Go, and be merry. See you Saturday!  PS. If the parenthetical name at the beginning of the email is NOT YOU, let me know ASAP - I goofed. Also, if you are Santa or Elf to your spouse or yourself, please let me know that too. I'm no pro, you know?  PPS. I don't know how to do a carriage return in this thing."

for i in peeps:
	send_email('jones.christopherd@gmail.com', '', peeps_addy_dict[i], 'Gift Exchange!', msg % (i, santa[i], elf[i]))
