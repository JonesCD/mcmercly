import random
from datetime import datetime

peeps = ['janie','courtney', 'anna', 'olessa', 'chris', 'marilyn', 'rich', 'mollie', 'eric']
peeps_dict = {}
picks_dict = {}
santa = {}
elf = {}
match = ''
rules = {'janie' : 0, 'courtney' : 2, 'anna' : 3, 'olessa' : 5, 'chris' : 6, 'marilyn' : 8, 'rich' : 9, 'mollie' : 11, 'eric' : 12}
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
        print('failed to send mail')

peeps_addy_dict = {'janie':'', 'courtney':'', 'anna':'', 'olessa':'', 'chris':'jones.christopherd@gmail.com', 'marilyn':'', 'rich':'', 'mollie':'', 'eric':''}


msg = "Hello, family member (%s)! We are having a group gift exchange! A Secret Santa. A celebration of the solstice/season/xmas/holidays/winter/new year/et cetera via randomly assinged gifting and surprises!\n\nThis year's exchange is in honor of the great naval aviator Commander Major McCe, who was largely lost to history but has the most amazing (and hard to find) biography, written by E.B. Sledge. Before getting into the exchange detail, let me take a moment to tell you about him. Major was his first name, and McCe is pronounced the same way as the abbreviated McDonalds (McD), but with the letter 'C'. A fun trivia fact, should it be in Trivial Pursuit, Cdr McCe joined the navy explicitely because it does not have the rank of Major, and he could avoid lame jokes referencing Catch-22 constantly being made at his expense.\n\nAnyway, Major McCe had been an electrical engineering major in college, and in the early days of the ARPANET he made significant, though highly classified, contributions to matching systems using randomly generated numbers. This work is a fundamental requirement for how cell phones switch towers now, and incidentally, is fairly similar to how our names are matched in the computer generated 'hat drawing' we are using for this gift exchange!\n\nBut, that is not the only way that Major McCe's life mirrors our own experience in this celebration. Major McCe was a test pilot with achievements as great as, though not as broadly recognized as Chuck Yeager's. The two had a torrid rivalry starting with Yeager repeatedly calling McCe 'McD', and making happy meal order jokes during their flight breifings. Major McCe retaliated with a reference to the name Chuck as hamburger meat, while making a call back to the McD joke, and actually got Yeager's call sign to be 'Hamburgler' at the Top Gun Academy. Anyway, that's an aside.\n\nMajor McCe broke several flight speed records, and with the experimental predecessor to the Rockwell X-30 he travelled at approximately Mach 16 from Floyd Bennet Field and NAS Litchfield Park. Apparently, it was not known before this flight that above Mach 10 or so, the well known 'sonic boom' starts to sound more like a sharp 'pop', and the flight test division sarted to call this a 'sky pop'. The military's obsession with abbreviation shortly created the shorthand for sky pop with: 'skype'. That's right - Major McCe had the first Skype session between New York and Arizona!\n\nBetween the random numbers and the skyping, who could we better pick to honor?\n\n\nSome rules:\nYou are assigned to be Santa to someone. This person will have a wish list, already shared in a Google Document. You are to gift this person from your own ideas or that list with things that cost to buy/manufacture/craft/commision/bake/import/build AND ship less than $100.\n\nYou are assigned to be Elf to someone else. Same rules, limited to $10 and you CANNOT use the wishlist - you are all on your thoughful own for this one.\n\nShipping addresses are in the wish list document, with instructions on how to address to the recipient in question. Gifts should be labeled 'To: Person, From: Santa|Elf'.\n\nThe deadline to add items to your wishlist is TBD, but we will be certain to leave everyone at least a week to take care of shopping and shipping before our exchange - the date of which is also TBD.\n\n\n\nYou are Santa to %s and Elf to %s.\n\n\n\nIf the parenthetical name in the first sentence of this email is NOT you, or if you are Santa or Elf to yourself shout out right away! Something has gone wrong if that happens.\n\nBe Merry,\nChris"

for i in peeps:
	send_email('jones.christopherd@gmail.com', '', peeps_addy_dict[i], 'Gift Exchange 2016 - the Major McCe Edition!', msg % (i, santa[i], elf[i]))
