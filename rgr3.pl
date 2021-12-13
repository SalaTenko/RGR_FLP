:-dynamic employees/4.
:-dynamic count/2.

employees(q,w,director,5000).
employees(r,t,cashier,1000).
employees(a,s,cashier,1000).
employees(f,g,cleaner,300).
employees(z,x,guard,500).


wearble:-employees(_,_,_,Salary), count(N,N1), X is N + Salary, X1 is N1 + 1, retract(count(N,N1)) ,assert(count(X,X1)), fail.

mean(Y):-count(N,N1), Y is N / N1.

goal:-retractall(count(_,_)), assert(count(0,0)),wearble;employees(Name,_,_, Salary), mean(Y), (Salary < Y -> writeln(Name)), fail.
