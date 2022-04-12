domains
	name = symbol.
	phoneNumber = symbol.
	
	
predicates
	phoneBook(name, phoneNumber).
	
clauses
	phoneBook("Gadgi", "8(999) 777-55-55").
	phoneBook("Kirill", "8(955) 123-33-44").
	phoneBook("Misha", "8(977) 455-45-45").
	phoneBook("Regina", "8(923) 232-23-32").
	phoneBook("Marina", "8(988) 898-88-99").
	phoneBook("Ya", "8(999) 999-99-99").
	
	
goal
	phoneBook(Name, PhoneNumber).