domains
	% Student
	studentId = integer.
	studentName = symbol.
	studentSurname = symbol.
	phoneNumber = symbol.
	
	% University
	universityId = integer.
	universityName = symbol.
	universityCity = symbol.
	
predicates
	student(studentId, studentName, studentSurname, phoneNumber).
	university(universityId, universityName, universityCity).
	studyIn(universityId, studentId).
	
	students(universityId, studentName, studentSurname, phoneNumber).
	
clauses
	student(0, "Gadgi", "Kishov", "8(999) 777-55-55").
	student(1, "Kirill", "Kovalets", "8(955) 123-33-44").
	student(2, "Misha", "Volkov", "8(977) 455-45-45").
	student(3, "Regina", "Khamzina", "8(923) 232-23-32").
	student(4, "Marina", "Maslova", "8(988) 898-88-99").
	student(5, "Nika", "Minakova", "8 (955) 955-55-55").
	student(6, "Ivan", "Tsvetkov", "8(999) 999-99-99").
	student(7, "Ira", "Kozlova", "8(777) 123-45-67").
	student(8, "Petr", "Mironov", "8(985) 985-85-85").
	student(9, "Enokentiy", "Degtyrev", "8 (999) 888-77-66").
	student(10, "Ilya", "Artemyev", "8 (912) 345-67-89").
	
	university(0, "BMSTU", "Moscow").
	university(1, "ITMO", "St.Petersburg").
	university(2, "DGU", "Mahachkala").
	
	studyIn(0, 0).
	studyIn(0, 1).
	studyIn(0, 2).
	studyIn(0, 3).
	studyIn(0, 4).
	studyIn(0, 6).
	studyIn(0, 7).
	
	studyIn(1, 5).
	studyIn(1, 8).
	studyIn(0, 9).
	
	studyIn(2, 0).
	studyIn(2, 10).
	
	
	students(UniversityId, Name, Surname, Phone) :-
		studyIn(UniversityId, StudentId),
		student(StudentId, Name, Surname, Phone).
	
	
	
goal
	%% Get all students info
	% student(Id, Name, Surname, Phone).
	
	%% Get all universyties info
	% university(Id, Name, Place).
	
	%% Get all students in university
	% students(0, Name, Surname, Phone).