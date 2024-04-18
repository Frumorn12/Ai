t(X,Y) :- not m(Y,X), a(X,Y,Z).
 	m(X,Y):- c(X), c(Y), not t(Y,X).
 	p(Y,X) :- t(X,Y), not m(Y,X).

 	c(1). c(2). a(2,1,3). 