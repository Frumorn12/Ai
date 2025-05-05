%%%%%%%%%%%
%Esercizio 2. 
%Si prenda in considerazione il gioco giapponese chiamato “FUTOSHIKI”. 
%In questo gioco matematico si deve riempire una griglia quadrata contenente 
% NxN celle, di modo che ogni riga o colonna contenga tutti e soli i numeri da 1 a N. 
% Sono inoltre presenti vincoli tra alcune celle adiacenti, espressi con un segno di maggiore 
% (o minore, a seconda del punto di vista), che devono ovviamente essere rispettati: se tra due celle adiacenti è presente la diseguaglianza, 
% i numeri collocati dovranno rispettarne il verso. Nella griglia di input possono essere 
% già presenti alcuni numeri che aiutano la risoluzione. Si scriva un programma logico ASP 
% che consenta ad un sistema (come ad esempio DLV) di risolvere il rompicapo: si modelli 
% adeguatamente il problema definendo in modo appropriato la struttura delle istanze in input, 
% e si sfrutti poi il paradigma “guess&check” per ottenere la soluzione

riga(1..5).
colonna(1..5).

maggiore(1,4,1,5).
maggiore(1,3,2,3).
maggiore(2,4,2,3).
maggiore(3,2,2,2).
maggiore(2,3,3,3).
maggiore(3,4,2,4).
maggiore(4,1,4,2).
maggiore(4,5,4,4).
maggiore(5,2,5,3).
maggiore(5,3,4,3).
maggiore(4,4,5,4).

cella(X,Y) :-riga(X), colonna(Y).
numero(X):-riga(X).

riempi(X,Y,N) | nonRiempi(X,Y,N) :- cella(X,Y), numero(N). % riempi la cella X,Y con il numero N , oppure non riempirla 
riempi(2,5,2).
%bisogna fare in modo che ogni cella sia piena con un  numero
piena (X,Y) :- riempi(X,Y,_).
:- cella(X,Y), not piena(X,Y). 

% ci sia solo un numero in ogni cella, cioè se è stata riempita con un numero N, non può essere riempita con un altro numero N1

:-  riempi(X,Y,N), riempi(X,Y,N1), N!= N1.

% niente numeri ripetuti in una riga 
:- riempi(X,Y,N), riempi(X,Y1,N), Y!=Y1. 

% niente numeri ripetuti in una colonna 
:- riempi(X,Y,N), riempi(X1,Y,N), X!=X1. 


:- maggiore(X,Y,X1,Y1), riempi(X,Y,N), riempi(X1,Y1,N1), N<N1. 