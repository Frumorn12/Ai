% Dato un grafo G = <N, A>, diciamo che G ha una cricca di 
% dimensione k se c'e' un insieme di k nodi tale che ogni 
% coppia di nodi al suo interno e' connessa da un arco.
%
% Scrivere un programma logico disgiuntivo che calcoli la 
% cricca di dimensione massima di un dato grafo, 
% rappresentato tramite la relazione binaria arc(Nodo1, Nodo2).

% arc(1,2).
% arc(2,3).
% arc(3,4).
% arc(1,5).
% arc(3,5).
% arc(2,5).
% arc(1,3).
% arc(3,6).


% arc(Y,X) :- arc(X,Y).
% node(X) :- arc(_, X).

% un nodo e' in una cricca se e' connesso a tutti gli altri nodi ,
% se no non e' in una cricca 
% cricca(X) | noCricca(X) :- node(X). 

% se abbiamo un nodo X che è in cricca, e 
% abbiamo un nodo Y che è in cricca,
% allora non puo essere che non siano connessi tra loro 
% :- cricca(X), cricca(Y), not arc(X,Y), X!=Y.

% qui mettiamo un costo per ogni nodo non in cricca.
% la soluzione ottima e' quella che ha il costo minore 
% quindi la massima cricca 
% :~ noCricca(X). [1@1,X] 


% == == == == == == == == == == == == == == == == == == == == == == == == == == == 
% Fill the knapsack without exceed the capacity and maximize the total value.
% Sei un ladro devi rubare il maggior valore possibile degli oggetti
% al minor peso possibile. 
% object(nome, valore, peso) 
% object(a,10,10).
% object(b,10,5).
% object(c,10,5).
% object(d,10,5).
% object(e,10,5).

% capacity(12).

% lo prendo o non lo prendo
% frico(Nome) | noFrico(Nome) :- object(Nome,_,_). % non va

% la somma dei pesi degli oggetti fricati non deve superare la capacita'
% :- capacity(C), #sum{Peso: frico(Nome), object(Nome,_,Peso)} > C. 

% dobbiamo fare il weak constraint che fa pagare di piu per ogni valore lasciato 
% non preso

% :~ noFrico(Nome), object(Nome,Valore,_). [Valore@1,Nome] % non va  

% Ci sono 10 studenti: 1, 2, ... 10. Devono essere assegnati a 4 stanze
% di un dormitorio: a, b, c, d. Ciascuna stanza puo' ospitare al massimo
% 3 studenti, e nessuno studente puo' essere assegnato a piu' di una
% stanza. 
%
% Oltre ai predicati 'room' e 'student', che rappresentano
% rispettivamente le 4 stanze del dormitorio e i 10 studenti, sono
% forniti anche i predicati 'adjacent' e 'friend'; 'adjacent definisce
% coppie di stanze adiacenti, mentre la relazione simmetrica 'friend'
% definisce coppie di amici. Le stanze adiacenti sono le seguenti:
% Gli assegnamenti devono rispettare i seguenti vincoli:
% 
% 1. Gli studenti 3 e 4 devono stare in stanze differenti.
% 2. Gli studenti 5 e 6 devono stare nella stessa stanza.
% 3. Ciascuna stanza deve ospitare almeno 2 studenti.
% 4. La stanza c deve ospitare esattamente 2 studenti.
% 5. Lo studente 9 deve stare in stanza con tutti i suoi amici.
% 6. Preferibilmente gli amici dovrebbero stare nella stessa stanza;
%    se non e' possibile, e' preferibile metterli in stanze adiacenti. 

% student(1..9).

% friend(1,3).
% friend(2,3).
% friend(6,4).
% friend(9,5).
% friend(1,2).
% friend(5,7).
% friend(5,4).
% friend(8,7).
%  friend(X,Y) :- friend(Y,X).

% room(a).
% room(b).
% room(c).
% room(d).

% adjacent(a,b).
% adjacent(b,c).
% adjacent(c,d).
% adjacent(X,Y) :- adjacent(Y,X).

% uno studente puo' essere assegnato a una stanza solo.
% assigned(X,a) | assigned(X,b) | assigned(X,c) | assigned(X,d) :- student(X).

% 1. Gli studenti 3 e 4 devono stare in stanze differenti.

% :- assigned(3,R), assigned(4,R). 

% 2. Gli studenti 5 e 6 devono stare nella stessa stanza.
% :- assigned(5,R1), assigned(6,R2), R1 != R2. 

% 3. Ciascuna stanza deve ospitare almeno 2 studenti.
% :- room(R), #count{X: assigned(X,R)} < 2 . 

% 4. La stanza c deve ospitare esattamente 2 studenti. 
% :-  #count{X: assigned(X, c)} != 2. 

% 5. Lo studente 9 deve stare in stanza con tutti i suoi amici.
% :- assigned (9, R), assigned (X, R1), R!=R1,  friend(X,9).

% sameRoom contiene gli studenti che appartengono alla stessa stanza
% sameRoom(X,Y) :- assigned(X,R), assigned(Y,R),X!=Y.
% adjacentRoom sono gli studenti che appartengono a due stanze adiacenti
% adjacentRoom(X,Y) :- assigned(X,R1), assigned(Y,R2), X!=Y, adjacent(R1,R2).

% il X<Y serve per evitare doppioni
% se tu hai friend(1,3) esiste anche friend(3,1). Con X<Y prendi solo friend(1,3)
% :~ friend(X,Y), not sameRoom(X,Y), X<Y. [1@2,X,Y]
% :~ friend(X,Y), not sameRoom(X,Y), not adjacentRoom(X,Y), X<Y. [1@1,X,Y]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Si consideri il seguente rompicapo. Obiettivo del gioco e' completare una griglia di 
% dimensione 4x4 con numeri che vanno da 1 a 9, rispettando 
% le seguenti semplici regole:  
% 1)	Ogni riga deve contenere numeri tutti diversi tra loro;
% 2)	Ogni colonna deve contenere numeri tutti diversi tra loro;
% 3)	La somma dei valori in una riga deve essere uguale al valore assegnato per quella riga;
% 4 )	La somma dei valori in una colonna deve essere uguale al valore assegnato per quella colonna;
% 5)	La somma dei valori sulla diagonale principale deve essere uguale ad un valore assegnato;

% Sono inoltre fornite le seguenti indicazioni:

% 6)	Nella prima riga è presente un 5;
% 7)	La terza riga e la terza colonna contengono valori disposti in ordine crescente;
% 8)	Il numero 3 compare esattamente una volta in tutta la griglia.

% Si risolva tale rompicapo tramite un opportuno programma dlv.
% Esempio:  Si consideri la seguente griglia 4x 4, con indicati i valori delle somme degli elementi sulle righe (12,14, 30 e 17), sulle colonne (17,15,23,18) e sulla diagonale principale (il 15 nell’angolo in basso).

% 				        12
% 				        14
% 				        30
% 				        17
% 17	15	23	18	15


% la soluzione del rompicapo è:
%  4	 1	 2	 5	12
%  5	 2	 4	 3	14
%  6	 7	 8	 9	30
%  2	 5	 9	 1	17
% 17	15	23	18	15

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

in(X,Y,1) | in(X,Y,2) | in(X,Y,3) | in(X,Y,4) |in(X,Y,5) |in(X,Y,6) |in(X,Y,7) |in(X,Y,8) |in(X,Y,9) :- cella(X,Y).

% 1) Ogni riga deve contenere numeri tutti diversi tra loro; 
:- in (X,Y,N), in(X,Y1,N1),Y!=Y1, N=N1.

% 2) Ogni colonna deve contenere numeri tutti diversi tra loro;
:- in (X,Y,N), in(X1,Y,N1),X!=X1, N=N1. 

% 3) La somma dei valori in una riga deve essere uguale al valore assegnato per quella riga;
:- sommaRiga(R, N), #sum{N1 : in(R,_,N1)} !=N. 

% 4 ) La somma dei valori in una colonna deve essere uguale al valore assegnato per quella colonna;
:- sommaColonna(Col, N), #sum{N1: in(_,Col,N1)} !=N.

% 5) La somma dei valori sulla diagonale principale deve essere uguale ad un valore assegnato;
:- sommaDiagonale(N), #sum{N1 : in(UGUALE,UGUALE,N1)} !=N. 

% 6)Nella prima riga è presente un 5;
contiene5 :- in(1,C,5).
:- not contiene5. 

% 7) La terza riga e la terza colonna contengono valori disposti in ordine crescente;

:- in(3,C,N) , in(3,C1,N1), C<C1, N>N1.
:- in(R,3,N) , in(R1,3,N1), R<R1, N>N1. 

% 8) Il numero 3 compare esattamente una volta in tutta la griglia.
:- not #count{X,Y: in(X,Y,3)} = 1 .