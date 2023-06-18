%check if something is a list 

is_list1([]). 
is_list1([_|H]) :- is_list1(H).

is_list2([]). 
is_list2([_|_]). 

%append two lists 

append2([], L2, L2). 
append2([H|T], L2, [H|Res]) :- append2(T, L2, Res). 

%check if element is a member of a list 

member1(X, [X|_]).
member1(X, [_|T]) :- member1(X, T). 

member2(X, L) :- append2(_, [X|_], L).

%find length of a list

len([], 0). 
len([_|T], N) :- len(T,M), N is M + 1. 

%find first element of a list

first([H|_], H).

%find last element of a list

last1([X], X).
last1([_|T], X) :- last(T,X).

last2(X, L) :- append2(_, [X], L). 

%reverse a list

reverse1(L, RL):- rev(L, [], RL).
rev([], Stack, Stack).
rev([H|T], Stack, R):- rev(T, [H|Stack], R).

%check if list is palindrome

is_palindrome(L) :- reverse1(L, L). 

%insert element at random position in a list 

insert(X, L, LR) :- append2(L1, L2, L), append2(L1, [X|L2], LR). 

%remove element from a list

remove(X, L, LR) :- append2(L1, [X|L2], L), append2(L1, L2, LR).

%generate all permutations of L 

permutation([], []).
permutation([H|T], PL) :- permutation(T, P2), insert(H, P2, PL).

%check if list is sorted

is_sorted(L) :- not((append(_, [H1, H2|_], L), H1 > H2)).

%bogoSort - we check every permutation of L and take the sorted one

bogoSort(L, SL) :- permutation(L, SL), is_sorted(SL). 

%sum of elements of a list 

sum([], 0).
sum([H|T], S) :- sum(T, S1), S is S1 + H.

%two ways to find maximum and minimum element in a list 
%first way - with recusions 
%second way - using the formula that X is mimnimum/maximum
%if it does not exist element from L that it's lesser/greater than X 

minNums(A, B, A) :- A =< B. 
minNums(A, B, B) :- A > B. 

min1([H], H).
min1([H|T], M) :- min1(T, M1), minNums(H, M1, M). 

min2(L, M) :- member1(M, L), not((member1(Y, L), M \= Y, Y < M)). 

maxNums(A, B, A) :- A >= B. 
maxNums(A, B, B) :- A < B. 

max1([H], H). 
max1([H|T], M) :- max1(T, M1), maxNums(H, M1, M). 

max2(L, M) :- member1(M, L), not((member1(Y, L), M \= Y, Y > M)). 

% Y is divisible by X 
div1(_,0).
div1(X, Y) :- Y >= X, Y1 is Y - X, div1(X, Y1). 
