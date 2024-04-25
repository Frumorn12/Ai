a(X,Z) :- b(X,Z,Y), not c(Z).
c(X):- d(X,Y), not a(X,X).
b(X,Y,Z) :- d(X,Y), d(Y,Z).
c(Y) | f(X,Y) :- a(Y,X).
:- b(X,Y,Z), c(X).

d(1,1).    d(2,1).