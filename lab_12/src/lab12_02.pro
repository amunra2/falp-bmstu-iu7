DOMAINS
	surname = symbol.
	
	% Telephone
	phoneNumber = symbol.
	city = symbol.
	street = symbol.
	houseNum = integer.
	apartmentNum = integer.
	addressStruct = address(city, street, houseNum, apartmentNum).
	
	% Car
	brand = symbol.
	color = symbol.
	price = integer.
	
	% Bank
	bank = symbol.
	bankAccount = integer.
	sum = integer.
	
	
PREDICATES
	phonebook(surname, phoneNumber, addressStruct).
	car(surname, city, brand, color, price).
	bankDepositor(surname, city, bank, bankAccount, sum).
	
	findByBrandColor(brand, color, surname, city, phoneNumber, bank).
	
CLAUSES
	phonebook("Petrov", "8 (999) 888-77-66", address("Moscow", "Baumanskaya", 50, 23)).
	phonebook("Ivanov", "8 (888) 777-66-55", address("Moscow", "Central", 23, 50)).
	phonebook("Smirnov", "8 (777) 123-23-32", address("Moscow", "Baumanskaya", 50, 23)).
	phonebook("Sergeev", "8 (999) 456-45-54", address("St. Petersburg", "Petrovskay", 45, 45)).
	phonebook("Ivanov", "8 (888) 135-53-15", address("St. Petersburg", "Petrovskay", 50, 23)).
	phonebook("Smirnov", "8 (555) 555-55-55", address("St. Petersburg", "Dvorcovaya", 1, 5)).
	phonebook("Petrov", "8 (123) 456-78-99", address("St. Petersburg", "Dvorcovaya", 5, 7)).
	
	car("Ivanov", "Moscow", "Mercedes", "red", 9000000).
	car("Ivanov", "St. Petersburg", "BMW", "black", 7000000).
	car("Smirnov", "Moscow", "Mercedes", "yellow", 8500000).
	car("Smirnov", "St. Petersburg", "Mercedes", "red", 10000000).
	car("Sergeev", "St. Petersburg", "Lamborgini", "black", 15000000).
	
	bankDepositor("Petrov", "Moscow", "Sberbank", 100000, 200000).
	bankDepositor("Petrov", "St. Petersburg", "Tinkoff", 50000, 100000).
	bankDepositor("Ivanov", "Moscow", "Sberbank", 25000, 300000).
	bankDepositor("Ivanov", "St. Petersburg", "Alpha", 100000, 150000).
	bankDepositor("Smirnov", "St. Petersburg", "Alpha", 300000, 500000).
	
	findByBrandColor(Brand, Color, Surname, City, PhoneNumber, Bank) :-
		car(Surname, City, Brand, Color, _),
		phonebook(Surname, PhoneNumber, address(City, _, _, _)),
		bankDepositor(Surname, City, Bank, _, _).
		
GOAL
	% 0 Solutions
	% findByBrandColor("Lada", "red", Surname, City, PhoneNumber, Bank).
	
	% 1 Solution
	% findByBrandColor("BMW", "black", Surname, City, PhoneNumber, Bank).
	
	% 2 Solutions
	findByBrandColor("Mercedes", "red", Surname, City, PhoneNumber, Bank).
