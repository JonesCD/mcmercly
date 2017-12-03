import random

peeps = ['alex', 'brian', 'olessa', 'chris', 'sarah', 'charlie', 'erika']
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
	else:
		picks_dict[person] = match

	return(picks_dict)

def matching_reindeer(person):
	global peeps_dict
	global picks_dict

	hat_pull = random.random()

	diff = float('inf')
	for key, value in peeps_dict.items():
		if diff > abs(hat_pull - value):
			diff = abs(hat_pull - value)
			match = key

	# can't be self
	if match == person:
		matching(person)
	# CAN be significant other

	# can't already be selected
	elif match in picks_dict.values():
		matching(person)
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

def go_reindeer():
	global picks_dict
	global santa
	global elf
	global reindeer
	picks_dict = {}
	for i in peeps:
		matching_reindeer(i)
	#can't have same reindeer as santa or elf
	for person in picks_dict.keys():
		if picks_dict[person] == santa[person]:
			go_reindeer()
		elif picks_dict[person] == elf[person]:
			go_reindeer()
	reindeer = picks_dict
	return(reindeer)



go_santa()
print(santa)
go_elf()
print(elf)
go_reindeer()
print(reindeer)

#email the results by person
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
        server.login('jones.christopherd@gmail.com', '')
        server.sendmail(FROM, TO, message)
        server.close()
        print('successfully sent the mail')
    except:
        print("failed to send mail")

peeps_addy_dict = {'chris': 'jones.christopherd@gmail.com', 'olessa': '', 'alex': '', 'charlie': '', 'erika': '', 'sarah': '', 'brian': ''}

msg = "Hello, member of the Fun Crowd (%s)! We are, again having a group gift exchange. A Secret Santa. A now habitual celebration of the solstice/season/xmas/holidays/winter/&c. via randomly assigned gifting and surprises! The THIRD annual event!\n\nLast year we appeared to be successful at avoiding intra-household collusion, so let's keep that up! That word, 'collusion', is much more powerful now. Please note that this is an email message to you, and you only. For your eyes only, in spy-speak (though, it is email, so maybe for Putin's also (too soon?) (joke left in from 2016)). Yes, it did come from my personal account, but you can be assured, I have the discipline to never bother looking in my sent-items folder. Maybe it isn't discipline, but the lack of a need to live in the past. Feel free to discuss that point with anyone you choose, but DO NOT DISCUSS YOUR GIFTING ASSIGNMENTS WITH ANYONE!\n\nTo remind you of the structure: you're 'Santa' to someone. That means you will be very thoughtful (again, all by yourself - you're a big kid, and I know you can handle this), and buy/craft/bake/commission/manufacture/find them a gift with a value (including tax and shipping (do NOT prorate your Amazon Prime membership)) of less than $20. This is strictly, though not violently, enforced.\n\nYou are also 'Elf' to someone. Same rules, except the spending limit is $5.\n\nYou are now, THIS YEAR!, also a 'Reindeer' to someone. You are NOT to spend a single cent on this person. This limitation is highly restrictive - if you make them something you CANNOT buy new supplies, unless they happen to be supplies for another project ALREADY planned, or use current supplies if you have another project planned for them. If you give them something you already own, you CANNOT have been contemplating a Craigslist ad for said item, or have another plan for deriving value from it. You shall NOT give trash or other detritus from the street. Be clever.\n\nRemember to label your gifts with a 'To: Person, From: Santa|Elf|Reindeer'.\n\n\n\nYou are Santa to %s, Elf to %s, and Reindeer to %s.\n\n\n\nIf the parenthetical name in the first sentence is you, or if you've been assigned to Santa, Elf, or Reindeer to yourself, hit me with a text message - something has gone very very wrong.\n\nBe Merry,\nChris \n\n\n\nP.S. Rules have modified this year for the sake of simplicity. You will not Santa or Elf within your own household, but Reindeer is possible. All three should be unique people. I used to limit it so that if you were Santa to someone they couldn't Santa to you, but that limitation proved to limiting with our small group, and I don't think we need to invite 5 or 10 more people to make that work better. I like you guys and tend to dislike stangers. Have an eggnog."


for i in peeps:
	send_email('jones.christopherd@gmail.com', '', peeps_addy_dict[i], 'Gift Exchange 2017 - Third time means three secrets!', msg % (i, santa[i], elf[i], reindeer[i]))
