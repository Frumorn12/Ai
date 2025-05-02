% Questo programma asp calcola tutte le cricche di dimensione k di un grafo G = <N, A>,
% dove N è l'insieme dei nodi e A è l'insieme degli archi.

% Some useful theorems
% Input - Facts representing nodes and edges:

node(1). node(2). node(3).
edge(1,2). edge(1,3).

% Guess - Generate all possible subset of nodes:
inS(X) | outS(X) :- node(X).

% Check – Discards subset of nodes that are not vertex cover (each edge has to be covered)
% Cioe' ogni arco deve avere almeno un nodo in S 
% se esiste edge(1,2) e non esiste ins(1) e non esiste ins(2) allora non va bene, allora va bene
:- edge(X,Y), not inS(X), not inS(Y). 