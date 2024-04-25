% Definisci l'intervallo e il numero di insiemi
k(2).
n(10).

% Genera tutti i possibili assegnamenti di numeri agli insiemi
1 { assign(N, I) : I=1..k } 1 :- N=1..n.