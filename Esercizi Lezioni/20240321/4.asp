a(X) :- not b(X), not q(X,1), s(X).
q(X,Y) | b(X) :- a(X), a(Y).

s(1).
s(2).