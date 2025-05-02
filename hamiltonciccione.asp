
% ASP G&C: Hamiltonian Path
% Input - Facts representing nodes, arcs and the starting node
node(1). node(2). node(3).
arc(1,2). arc(2,3). arc(3,4). arc(4,1). arc(3,1).
start(3).

% Guess - Generate all possible subset of arcs:

inPath(X,Y) | outPath(X,Y) :- arc(X,Y).

% Check – Discards subset of arcs that are not Hamiltonian paths
% Cioe' ogni nodo deve essere visitato una sola volta 
:- inPath(X,Y), inPath(X,Y1), Y != Y1.
:- inPath(X,Y), inPath(X1,Y), X != X1.
:- node(X), not reached(X).
:- inPath(X,Y), start(Y). 
reached(X) :- start(X). % significa che il nodo di partenza e' raggiunto 
reached(X) :- reached(Y), inPath(Y,X).