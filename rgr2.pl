h([H|T], Head, R) :- string_chars(Head, H), T is R.
sec([H|T], Num) :- Num is T.
fst([H|T], Num) :- string_chars(Str, H), Num = Str.

check([],[]):- !.
check([H|T],[Head|Tail]):-
        H =:= 10, Head is 32, check(T,Tail).
check([H|T],[Head|Tail]):-
        Head is H, check(T,Tail).

Watch([],[]):- !.
Watch([Head| Tail],[H|T]):-
        length(Tail, Length),
        %my_delete(Tail, Head|Tail, Res),
        delete(Tail, Head, Res),
        %writeln(Res),
        length(Res, Len),
        R = Length - Len + 1,
        h(H,Head,R),
        countWord(Res, T).

outList([]):-  !.
outList([H|T]):-
        sec(H,Num),fst(H,Wrd),
        write(Wrd), write(" - "), write(Num),
        outList(T).

goal():-
        open('D:prolog/in.txt', read, F),
        see(F),
        seeing(F),
        read_stream_to_codes(F, L10),
        check(L10, L),
        seen,
        string_to_list(S, L),
        split_string(S, " ", " ", R),
        Watch(R, Res),
        tell('D:prolog/out.txt'),
        outList(Res),
        told.

