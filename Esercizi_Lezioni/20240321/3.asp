parigi(X) | londra(X) :- ferie(X), not malato(X).
malato(X) :- ferie(X), not parigi(X).
ferie(X) :- periodo(X,Y), malato(Y).	

malato(1). ferie(3). periodo(2,3). periodo(4,2). parigi(4).
