% Esercizio 2. Dato un grafo G = <N, A>, diciamo che G ha una cricca di dimensione k se c'è un insieme di 
% k nodi tale che ogni coppia di nodi al suo interno è connessa da un arco. Scrivere un programma  ASP che 
% calcoli  la  cricca  di  dimensione  massima  di  un  dato  grafo,  rappresentato  tramite  la  relazione  binaria 
% arc(Nodo1, Nodo2). 

arc(1,2). 
arc(2,3). 
arc(3,4). 
arc(1,5). 
arc(3,5). 
arc(2,5). 
arc(1,3). 
arc(3,6).

arc(X,Y) :- arc(Y,X).
node(X) :- arc(_,X).



inClique(X) | outClique(X) :- node(X). 
:- inClique(X), inClique(Y), not arc(X,Y), X!=Y.

:~ outClique(X). [1@1, X]