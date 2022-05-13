PREDICATES
	factor(integer, integer).
	factorRec(integer, integer, integer).
	
	fib(integer, integer).
	fibRec(integer, integer, integer, integer).
	
	
CLAUSES
	factorRec(Num, Result, Temp) :- Num <= 1, Result = Temp, !. 
	
	factorRec(Num, Result, Temp) :-
		TmpRes = Temp * Num,
		TmpNum = Num - 1,
		factorRec(TmpNum, Result, TmpRes).
	
	
	factor(Num, Result) :- factorRec(Num, Result, 1).
	
	
	fibRec(Num, Result, PrevRes, _) :- Num < 2, Result = PrevRes, !.
	
	fibRec(Num, Result, PrevPrevRes, PrevRes) :-
		TmpNum = Num - 1,
		NextPrevRes = PrevPrevRes + PrevRes,
		fibRec(TmpNum, Result, PrevRes, NextPrevRes).
	
	
	fib(Num, Result) :- fibRec(Num, Result, 1, 1).
	
	
GOAL
	% factor(5, Result). % 120
	fib(10, Result). % 55
