import random
from datetime import datetime

peeps = ['erika', 'alex', 'brian', 'olessa', 'chris', 'sarah', 'charlie']
peeps_dict = {}
picks_dict = {}
santa = {}
elf = {}
match = ''
rules = {'erika' : 0, 'alex' : 2, 'brian' : 3, 'olessa' : 5, 'chris' : 6, 'sarah' : 8, 'charlie' : 9}
for person in peeps:
	peeps_dict[person] = random.random()

def matching(person):
	global peeps_dict
	global picks_dict

	hat_pull = random.random()
	print(hat_pull)

	diff = float('inf')
	for key, value in peeps_dict.items():
		if diff > abs(hat_pull - value):
			diff = abs(hat_pull - value)
			match = key

	# can't be self
	if match == person:
		matching(person)
	# can't be significant other
	elif abs(rules[person] - rules[match]) == 1:
		matching(person)
	# can't already be selected
	elif match in picks_dict.values():
		matching(person)
	# can't have same person that has you
	elif match in picks_dict.keys(): 
		if picks_dict[match] == person:
			matching(person)
		else:
			picks_dict[person] = match
	else:
		picks_dict[person] = match

	return(picks_dict)

def go_santa():
	global picks_dict
	global santa
	picks_dict = {}
	for i in peeps:
		matching(i)
	santa = picks_dict
	return(santa)

def go_elf():
	global picks_dict
	global santa
	global elf
	picks_dict = {}
	for i in peeps:
		matching(i)
	# can't have same santa as elf
	for person in picks_dict.keys():
		if picks_dict[person] == santa[person]:
			go_elf()
	elf = picks_dict
	return(elf)

go_santa()
go_elf()
#print(santa)
#print(elf)

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
        print('successfully sent the mail')
    except:
        print("failed to send mail")

peeps_addy_dict = {'chris': 'jones.christopherd@gmail.com', 'olessa', 'alex', 'charlie', 'erika', 'sarah', 'brian'}


msg = "Hello, member of the Fun Crowd (%s)! We are, again having a group gift exchange. A Secret Santa. A now habitual celebration of the solstice/season/xmas/holidays/winter/etc via randomly assigned gifting and surprises! The second annual event!\n\nLast year we suffered a major failing of the rules, in that there was horrendous collusion behind closed doors. Please note that this is an email message to you, and you only. For your eyes only, in spy-speak (though, it is email, so maybe for Putin's also (too soon?)). Yes, it did come from my personal account, but you can be assured, I have the discipline to never bother looking in my sent-items folder. Maybe it isn't discipline, but the lack of a need to live in the past. Feel free to discuss that point with anyone you choose, but DO NOT DISCUSS YOUR GIFTING ASSIGNMENTS WITH ANYONE!\n\nTo remind you of the structure: you're 'Santa' to someone. That means you will be very thoughtful (again, all by yourself - you're a big kid, and I know you handle this), and buy/craft/bake/commission/manufacture/find them a gift with a value (including tax and shipping (do NOT prorate your Amazon Prime membership)) of less than $15. This is strictly enforced.\n\nYou are also 'Elf' to someone. Same rules, except the spending limit is $3. You can see that all together this is less than a Hamilton, and really, since the Broadway sensation isn't everything lesser than Hamilton?\n\nRemember to label your gifts with a 'To: Person, From: Santa|Elf'.\n\n\n\nYou are Santa to %s and Elf to %s.\n\n\n\nIf the parenthetical name in the first sentence is you, or if you've been assigned to Santa or Elf yourself, hit me with a text message - something has gone very very wrong.\n\nBe Merry,\nChris"

for i in peeps:
	send_email('jones.christopherd@gmail.com', '', peeps_addy_dict[i], 'Gift Exchange - 12/10/16 - Up the Hudson Edition!', msg % (i, santa[i], elf[i]))
