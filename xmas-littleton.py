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
print(santa)
print(elf)

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

peeps_addy_dict = {'janie':'jones.christopherd@gmail.com', 'courtney':'jones.christopherd@gmail.com', 'anna':'jones.christopherd@gmail.com', 'olessa':'jones.christopherd@gmail.com', 'chris':'jones.christopherd@gmail.com', 'marilyn':'jones.christopherd@gmail.com', 'rich':'jones.christopherd@gmail.com', 'mollie':'jones.christopherd@gmail.com', 'eric':'jones.christopherd@gmail.com'}


msg = "Hello, family member (%s)! We are having a group gift exchange. A Secret Santa. A celebration of the solstice/season/xmas/holidays/winter/new year/et cetera via randomly assigned gifting and surprises!\n\nThis year’s exchange is in honor of the great naval aviator Commander Major McCe. Major was his first name, and McCe is pronounced the same was as the abbreviated McDonalds name McD, but with the letter ‘C’. A fun trivia fact, should it come up in pub quiz or Trivial Pursuit one day, but Cdr McCe joined the navy explicitly to avoid lame jokes referencing Catch-22, as the navy has no rank of Major.\n\nAnyway, Major McCe had been an electrical engineering major, and in the days of the ARPANET made great, though highly classified, contributions to using randomly generated numbers to organize matching systems – a fundamental requirement for how cell phones switch towers now, and incidentally, fairly similar to how our names are matched in the computer generated ‘hat drawing’ that this email is the result of.\n\nMajor McCe had another groundbreaking feat, in that as a test pilot with achievements as great as, but not as recognized as Chuck Yeager’s (whom McCe referred to as ‘Hamburgler’ as a referenced to beef-chuck and a response to Yeager’s attempts to mock McCe by calling him McD in flight school), he broke several flight speed records. With the experimental predecessor to the Rockwell X-30, Major McCe travelled at approximately Mach-16 between Floyd Bennet Field in NY to NAS Litchfield Park, outside Phoenix. Apparently, above Mach-10, the well known ‘sonic boom’ sounds more like a ‘pop’, and the flight test division referred to this as a ‘sky pop’, which as a result of the military obsession with abbreviation became known as a ‘skype’. Essentially, Major McCe had the first Skype between New York and Arizona, and he had changed the world with randomization based assignments. What could possibly be more apt?\n\nSome rules for our exchange:\nYou are assigned to be Santa to someone. This person will have a wish list, shared in a public document separately. You are to gift to this person from their list or not, with things that cost to buy/manufacture/craft/commission/bake AND ship less than $100.\n\nYou are assigned to be Elf to someone different. Same rules, limited to $10 and CANNOT be from their wish list – you are all on your thoughtful own for this one.\n\nLabel your gifts with a 'To: Person, From: Santa|Elf'. Shipping addresses and formalities will come in later emails.\n\nAnother email will come for a shared google document to put your wishlist on – the deadline for putting things on there will be determined in another email, but with enough time to allow everyone a full week before our celebration.n\n\n\nYou are Santa to %s and Elf to %s.\n\n\n\nIf the parenthetical name in the first sentence is not you, or if you've been assigned to Santa or Elf yourself, hit me with a text message - something has gone very very wrong.\n\nBe Merry,\nChris"

for i in peeps:
	send_email('jones.christopherd@gmail.com', '', peeps_addy_dict[i], 'Gift Exchange 2016 - the Major McCe Edition!', msg % (i, santa[i], elf[i]))
