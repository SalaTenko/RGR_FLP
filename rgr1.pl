h([H|T], Head, R) :- H is Head, T is R.
sec([H|T], Num) :- Num is T.
fst([H|T], Num) :- Num is H.

watch([],[]) :-! .
watch([Head|Tail],[H|T]) :-
  length(Tail, Length),
  delete(Tail, Head, Result),
  length(Result, S),
  R is Length - S + 1, h(H, Head, R),
watch(Result, T).

finList([],[]) :- !.
finList([H|T], [Head|Tail]) :-
  sec(H, Num), Num > 1, fst(H, Head), finList(T, Tail).
finList([H|T], Tail) :- finList(T, Tail).

goal() :-
  read(List),
  watch(List, WatchList),
  finList(WatchList, Fin),
  write(Fin).

% [5,1,2,1,3,5,5,7] –> [5,1].
