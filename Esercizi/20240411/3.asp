% Esercizio 3. Si consideri il seguente rompicapo. Obiettivo del gioco è completare una griglia di dimensione 4x4 
% con numeri che vanno da 1 a 9, rispettando le seguenti semplici regole:   
% 1) Ogni riga deve contenere numeri tutti diversi tra loro; 
% 2) Ogni colonna deve contenere numeri tutti diversi tra loro; 
% 3) La somma dei valori in una riga deve essere uguale al valore assegnato per quella riga; 
% 4) La somma dei valori in una colonna deve essere uguale al valore assegnato per quella colonna; 
% 5) La somma dei valori sulla diagonale principale deve essere uguale ad un valore assegnato; 
 
% Sono inoltre fornite le seguenti indicazioni: 
 
% 6) Nella prima riga è presente un 5; 
% 7) La terza riga e la terza colonna contengono valori disposti in ordine crescente; 
% 8) Il numero 3 compare esattamente una volta in tutta la griglia. 
 
% Si risolva tale rompicapo tramite un opportuno programma. 
% Esempio:  Si consideri la seguente griglia 4x 4, con indicati i valori delle somme degli elementi sulle righe (12,14, 30 
% e 17), sulle colonne (17,15,23,18) e sulla diagonale principale (il 15 nell’angolo in basso). 

cifra(1..9). 
riga(1..4). 
col(1..4). 
cella(X,Y) :- riga(X), col(Y). 
sommaRiga(1,12). 
sommaRiga(2,14). 
sommaRiga(3,30). 
sommaRiga(4,17). 
sommaColonna(1,17). 
sommaColonna(2,15). 
sommaColonna(3,23). 
sommaColonna(4,18). 
sommaDiag(15).


% Guess 
in(X,Y,C) | notIn(X,Y,C) :- cella(X,Y), cifra(C). 


% tutte le celle devono essere riempite 
piena(X,Y) :- in(X,Y,_). 
:- cella(X,Y), not piena(X,Y).


% ad ogni cella deve essere assegnato un solo valore 
:- in(X,Y,C), in(X,Y,C1), C != C1. 

% 1) Ogni riga deve contenere numeri tutti diversi tra loro;
:- in(X,Y,C), in(X,Y1,C), Y != Y1. 



% 2) Ogni colonna deve contenere numeri tutti diversi tra loro; 
:- in(X,Y,C), in(X1,Y,C), X != X1. 


% 3) La somma dei valori in una riga deve essere uguale al valore assegnato per quella riga; 

:- sommaRiga(R,S), not #sum{C: in(R,_,C)} = S. 


% 4) La somma dei valori in una colonna deve essere uguale al valore assegnato per quella colonna; 

:- sommaRiga(R,S), not #sum{C: in(R,_,C)} = S. 

% 5) La somma dei valori sulla diagonale principale deve essere uguale ad un valore assegnato; 

:- sommaDiag(S), not #sum{C: in(X,X,C)} = S.

  
% 6) Nella prima riga è presente un 5; 
contiene5(R) :- in(R,C,5). 
:- not contiene5(1).



% 7) La terza riga e la terza colonna contengono valori disposti in ordine crescente; 

crescente(3). 
:- crescente(R), in(R,Y,C), in(R,Y1,C1), Y<Y1, C>C1. 
:- crescente(Col), in(X,Col,C), in(X1,Col,C1), X<X1, C>C1.


% 8) Il numero 3 compare esattamente una volta in tutta la griglia. 

:- not #count{X,Y: in(X,Y,3)} = 1. 


