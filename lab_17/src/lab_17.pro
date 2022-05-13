DOMAINS
	list = integer*.

PREDICATES
	len(list, integer).
	lenRec(list, integer, integer).
	
	sum(list, integer).
	sumRec(list, integer, integer).
	
	sumOdd(list, integer).
	sumOddRec(list, integer, integer).
	
CLAUSES
	% 1
	lenRec([], Res, CurRes) :- Res = CurRes, !.
	lenRec([_|T], Res, CurRes) :-
		TmpRes = CurRes + 1,
		lenRec(T, Res, TmpRes).
		
	len(List, Result) :- lenRec(List, Result, 0).
	
	% 2
	sumRec([], Res, CurRes) :- Res = CurRes, !.
	sumRec([H|T], Res, CurRes) :-
		TmpRes = CurRes + H,
		sumRec(T, Res, TmpRes).
		
	sum(List, Result) :- sumRec(List, Result, 0).
	
	% 3
	sumOddRec([], Res, CurRes) :- Res = CurRes, !.
	sumOddRec([_|[H|T]], Res, CurRes) :-
		TmpRes = CurRes + H,
		sumOddRec(T, Res, TmpRes), !.
	sumOddRec([_|[H|_]], Res, CurRes) :- 
		Res = CurRes + H.
		
	sumOdd(List, Result) :- sumOddRec(List, Result, 0).

GOAL
	% len([1, 2, 3, 4, 5], Result).
	% sum([1, 2, 3, 4, 5], Result).
	% sumOdd([1, 2, 3, 4], Result).