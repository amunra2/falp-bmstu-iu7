DOMAINS
	list = integer*.

PREDICATES
	listBiggerThan(list, integer, list).
	listOddPoses(list, list).
	del(list, integer, list).
	set(list, list).
	
CLAUSES
	% 1
	listBiggerThan([H|T], Num, [H|AddTail]) :-
		H > Num, !,
		listBiggerThan(T, Num, AddTail).
	listBiggerThan([_|T], Num, Res) :- listBiggerThan(T, Num, Res), !.
	listBiggerThan([], _, []).
	
	% 2
	listOddPoses([_|[H|T]], [H|AddTail]) :-
		listOddPoses(T, AddTail), !.
	listOddPoses([_], []) :- !.
	listOddPoses([], []).
	
	% 3
	del([H|T], Elem, AddTail) :-
		H = Elem, !,
		del(T, Elem, AddTail).
	del([H|T], Elem, [H|AddTail]) :-
		del(T, Elem, AddTail), !.
	del([], _, []).
	
	% 4
	set([H|T], [H|Result]) :-
		del(T, H, Tmp),
		set(Tmp, Result), !.
	set([], []).
	
GOAL
	% listBiggerThan([1, 2, 3, 4, 5], 3, Result). % Result=[4,5]
	% listOddPoses([1, 2, 3, 4, 5], Result). % Result=[2,4]
	% del([3, 1, 2, 3, 3, 4, 5, 3], 3, Result). % Result=[1,2,4,5]
	% set([3, 1, 2, 2, 3, 3, 4, 5, 5, 5, 3], Result). % Result=[3,1,2,4,5]