DOMAINS
	name = symbol.
	gender = symbol.
	parent = struct_parent(name, gender).
	
PREDICATES
	parentOf(parent, name).
	ancestors(symbol, symbol, symbol, symbol, symbol).
	
CLAUSES
	% 1
	parentOf(struct_parent(edward, m), kirill).
	parentOf(struct_parent(maria, w), kirill).
	
	% 2
	parentOf(struct_parent(anton, m), edward).
	parentOf(struct_parent(regina, w), edward).
	parentOf(struct_parent(sergey, m), maria).
	parentOf(struct_parent(marina, w), maria).
	
	% 3
	parentOf(struct_parent(gadgi, m), anton).
	parentOf(struct_parent(inna, w), anton).
	parentOf(struct_parent(mikhail, m), regina).
	parentOf(struct_parent(elena, w), regina).
	parentOf(struct_parent(ivan, m), sergey).
	parentOf(struct_parent(kristina, w), sergey).
	parentOf(struct_parent(yuriy, m), marina).
	parentOf(struct_parent(natalia, w), marina).
	
	% Rule
	ancestors(Child, GMaMother, GPaMother, GMaFather, GPaFather) :-
		parentOf(struct_parent(Mother, w), Child), parentOf(struct_parent(Father, m), Child),
		parentOf(struct_parent(GMaMother, w), Mother), parentOf(struct_parent(GPaMother, m), Mother),
		parentOf(struct_parent(GMaFather, w), Father), parentOf(struct_parent(GPaFather, m), Father).
	
GOAL
	%% 1 -- GMaMother = marina, GMaFather = regina
	% ancestors(kirill, GMaMother, _, GMaFather, _).
	
	%% 2 -- GPaMother = sergey, GPaFather = anton
	% ancestors(kirill, _, GPaMother, _, GPaFather).
	
	%% 3 -- GMaMother=marina, GPaMother=sergey, GMaFather=regina, GPaFather=anton
	% ancestors(kirill, GMaMother, GPaMother, GMaFather, GPaFather).
	
	%% 4 -- GMaMother=marina
	% ancestors(kirill, GMaMother, _, _, _).
	
	%% 5 -- GMaMother=marina, GPaMother=sergey
	ancestors(kirill, GMaMother, GPaMother, _, _).