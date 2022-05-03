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
	
	property = building(price, addressStruct);
		   area(price, integer);
		   car(brand, color, price);
		   waterTransport(price, symbol).
	
PREDICATES
	phonebook(surname, phoneNumber, addressStruct).
	bankDepositor(surname, city, bank, bankAccount, sum).
	owner(surname, property).
	
	ownObjects(surname, property).
	ownObjectsPrice(surname, property, price).
	ownPriceCount(surname, property, price).
	ownFullPrice(surname, price).
	
CLAUSES
	phonebook("Petrov", "8 (999) 888-77-66", address("Moscow", "Baumanskaya", 50, 23)).
	phonebook("Ivanov", "8 (888) 777-66-55", address("Moscow", "Central", 23, 50)).
	phonebook("Smirnov", "8 (777) 123-23-32", address("Moscow", "Baumanskaya", 50, 23)).
	phonebook("Sergeev", "8 (999) 456-45-54", address("St. Petersburg", "Petrovskay", 45, 45)).
	phonebook("Ivanov", "8 (888) 135-53-15", address("St. Petersburg", "Petrovskay", 50, 23)).
	phonebook("Smirnov", "8 (555) 555-55-55", address("St. Petersburg", "Dvorcovaya", 1, 5)).
	phonebook("Petrov", "8 (123) 456-78-99", address("St. Petersburg", "Dvorcovaya", 5, 7)).
	
	bankDepositor("Petrov", "Moscow", "Sberbank", 100000, 200000).
	bankDepositor("Petrov", "St. Petersburg", "Tinkoff", 50000, 100000).
	bankDepositor("Ivanov", "Moscow", "Sberbank", 25000, 300000).
	bankDepositor("Ivanov", "St. Petersburg", "Alpha", 100000, 150000).
	bankDepositor("Smirnov", "St. Petersburg", "Alpha", 300000, 500000).
	
	owner("Ivanov", building(500000, address("Moscow", "Central", 23, 23))).
	owner("Ivanov", car("Mercedes", "Black", 100000)).
	owner("Ivanov", area(500000, 350)).
	owner("Ivanov", waterTransport(300000, "Ship")).
	
	owner("Petrov", building(500000, address("Moscow", "Baumanskaya", 50, 23))).
	owner("Petrov", car("Mercedes", "red", 100000)).
	owner("Petrov", waterTransport(10000, "Watercycle")).
	
	owner("Smirnov", car("BMW", "Black", 50000)).
	owner("Smirnov", area(250000, 200)).
	owner("Smirnov", waterTransport(150000, "Ship")).
	
	ownObjects(Surname, building) :- owner(Surname, building(_, _)).
	ownObjects(Surname, car) :- owner(Surname, car(_, _, _)).
	ownObjects(Surname, waterTransport) :- owner(Surname, waterTransport(_, _)).
	ownObjects(Surname, area) :- owner(Surname, area(_, _)).
	
	ownObjectsPrice(Surname, building, Price) :- owner(Surname, building(Price, _)).
	ownObjectsPrice(Surname, car, Price) :- owner(Surname, car(_, _, Price)).
	ownObjectsPrice(Surname, waterTransport, Price) :- owner(Surname, waterTransport(Price, _)).
	ownObjectsPrice(Surname, area, Price) :- owner(Surname, area(Price, _)).

	ownPriceCount(Surname, building, Price) :- owner(Surname, building(Price, _)), !.
	ownPriceCount(Surname, car, Price) :- owner(Surname, car(_, _, Price)), !.
	ownPriceCount(Surname, waterTransport, Price) :- owner(Surname, waterTransport(Price, _)), !.
	ownPriceCount(Surname, area, Price) :- owner(Surname, area(Price, _)), !.
	ownPriceCount(_, _, 0).
	
	ownFullPrice(Surname, Price) :-
		ownPriceCount(Surname, building, Price1),
		ownPriceCount(Surname, car, Price2),
		ownPriceCount(Surname, area, Price3),
		ownPriceCount(Surname, waterTransport, Price4),
		Price = Price1 + Price2 + Price3 + Price4.	

GOAL
	% Task 1
	%% ownObjects("Ivanov", Object).
	% Task 2
	%% ownObjectsPrice("Petrov", Object, Price).
	% Tssk 3
	ownFullPrice("Smirnov", Price).