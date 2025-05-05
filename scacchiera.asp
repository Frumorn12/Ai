% ==============================================================================
% Scrivere un programma ASP che posizioni 8 regine su una scacchiera 8*8 di modo che 
% nessuna delle regine ne attacchi un'altra, secondo le regole standard degli scacchi.
% Si ricorda che un pezzo è sotto attacco di una regina se questo si trova sulla
% sua stessa riga, oppure sulla sua stessa colonna, oppure sulla sua stessa diagonale.


row(1..8).

% guess horizontal position for each row
q(X,1) | q(X,2) | q(X,3) | q(X,4) | q(X,5) | q(X,6) | q(X, 7) | q(X,8) :- row(X).


:- q(X,Y), q(X,Y1), Y!=Y1. % no two queens in the same row 
:- q(X,Y), q(X1,Y), X!=X1. % no two queens in the same column 

% no two queens in the same diagonal 
:- q(X,Y), q(X1,Y1), X+X1==Y+Y1. % no two queens in the same diagonal 
:- q(X,Y), q(X1,Y1), X-X1==Y-Y1. % no two queens in the same diagonal 