PREDICATES
	maxOf2(real, real, real).
	maxOf2WithCut(real, real, real).
	
	maxOf3(real, real, real, real).
	maxOf3WithCut(real, real, real, real).
	
CLAUSES
	maxOf2(A, B, A) :- A >= B.
	maxOf2(A, B, B) :- A < B.
	maxOf2WithCut(A, B, A) :- A >= B, !.
	maxOf2WithCut(_, B, B).
	
	maxOf3(A, B, C, A) :- A >= B, A >= C.
	maxOf3(A, B, C, B) :- B >= A, B >= C.
	maxOf3(A, B, C, C) :- C >= A, C >= B.
	maxOf3WithCut(A, B, C, A) :- A >= B, A >= C, !.
	maxOf3WithCut(_, B, C, B) :- B >= C, !.
	maxOf3WithCut(_, _, C, C).
	
GOAL
	% maxOf2(10, 1, Max). % 10
	% maxOf2(1, 10, Max). % 10
	
	% maxOf2WithCut(10, 1, Max). % 10
	% maxOf2WithCut(1, 10, Max). % 10
	
	% maxOf3(10, 5, 1, Max). % 10
	% maxOf3(5, 10, 1, Max). % 10
	
	% maxOf3WithCut(10, 5, 1, Max). % 10
	maxOf3WithCut(5, 10, 1, Max). % 10