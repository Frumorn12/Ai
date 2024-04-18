% Esercizio 4. Sia G=<V,E> un grafo orientato definito tramite i predicati (fatti) 
% edge(Vertex1,Vertex2,Color), e vertex(N,Color), in cui gli archi e i nodi sono colorati con 3 colori 
% differenti (rosso, verde, blu). Stabilire se esiste un sottoinsieme SDIV di V avente  le seguenti proprietà:  
%   1. SDIV è non vuoto. 
%   2. presi due qualunque nodi v1 e v2 in SDIV, e dati i loro colori C1 e C2, nessun arco che li connette 
%      può essere di colore C1 o C2. 
%   3. la cardinalità (numero di nodi) di SDIV è massima.


edge(1,2,r). 
edge(1,3,b). 
edge(1,4,g). 
vertex(1,b). 
vertex(2,g). 
vertex(3,r). 
vertex(4,b).

in(X) | out(X) :- vertex(X,_). 
 
% mai nodi con un arco che abbia lo stesso colore di uno dei due 
:- in(X), in(Y), edge(X,Y,C), vertex(X,C). 
:- in(X), in(Y), edge(X,Y,C), vertex(Y,C). 
 
% massimalita 
:~ out(X). [1@1,X] 
 
% insieme non vuoto  
almenoUno:- in(X). 
:- not almenoUno.