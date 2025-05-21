% == == == == == == == == == == == == == == == == == == == == == == == == == == == 
% Compute the minimum as well as the maximum distance between nodes. 
% NOTE: distance is defined as usual.

% arc(Node1,Node2, Distance).

% arc(a,b,1).
% arc(b,d,1).
% arc(a,c,2).
% arc(c,d,1).
% arc(d,e,2).
% arc(c,e,1).

% Se dobbiamo per esempio trovare la distanza tra a e b, dovra essere 1.
% distanza(primo nodo, secondo nodo, distanza tra primo e secondo). 
% distanza(X,Y,D) :- arc(X,Y,D). 
                                                                          %       2   1     = 3
% Se dobbiamo trovare la distanza tra 'a' ed 'e'  per esempio, dovra essere 3. a -> c -> e
 %       a e           a c  2            c e 1    3= 2+1 
% distanza(X,Z,D) :- arc(X,Y,D1), distanza(Y,Z,D2), D=D1+D2.   

% minima_distanza(X,Y,D) :- distanza(X,Y,D),  D = #min{ V : distanza(X,Y,V)}. 
% massima_distanza(X,Y,D) :- distanza(X,Y,D), D = #max{ V : distanza(X,Y,V)}. 
% == == == == == == == == == == == == == == == == == == == == == == == == == == == 


% Give out the row with maximum number of zeros.

% matrix(row,column,val).

%matrix(0,0,1).
%matrix(0,1,0).
%matrix(0,2,1).
%matrix(0,3,1).
%matrix(1,0,1).
%matrix(1,1,1).
%matrix(1,2,1).
%matrix(1,3,1).
%matrix(2,0,1).
%matrix(2,1,1).
%matrix(2,2,1).
%matrix(2,3,1).
%matrix(3,0,1).
%matrix(3,1,1).
%matrix(3,2,1).
%matrix(3,3,1).

%row(X) :- matrix(X,_,_).  % prendiamo tutte le righe della matrice 
%zeroXRow(R,N) :- row(R), N = #count{ Y : matrix(R,Y,0)}. % contiamo gli zeri in ogni riga.

% ora dobbiamo trovare la riga
% con il numero massimo di zeri

% prima troviamo il valore massimo e lo salviamo
%max(N) :- N = #max{Num : zeroXRow(Row,Num)}. 

% e poi creiamo rowMax 
%rowMax(R) :- zeroXRow(R,N), max(N). 

% == == == == == == == == == == == == == == == == == == == == == == == == == == == 
% 2-D discrete tomography
%
% EXAMPLE:
% ------------
%    2 2 2 0
%   +-+-+-+-+
% 3 | | | | |
%   +-+-+-+-+
% 2 | | | | |
%   +-+-+-+-+
% 1 | | | | |
%   +-+-+-+-+


hpos(1..4).
vpos(1..3).
cella(X,Y) :- hpos(X), vpos(Y).

hsum(1,2).
hsum(2,2).
hsum(3,2).
hsum(4,0).

vsum(1,3).
vsum(2,2).
vsum(3,1).


riempi(X,Y) | noRiempi(X,Y) :- cella(X,Y). 

% il nostro obbiettivo è quello di far si che la somma

% È vietato che, per una riga Y, se la somma richiesta è N, 
% il numero di celle riempi(X,Y) presenti su quella riga non sia uguale a N.
:- hsum(Y, N), not #count{ X : riempi(X,Y) } = N. 
:- vsum(X, N), not #count{ Y : riempi(X,Y) } = N. 