%% Scrivere un programma ASP senza disgiunzione e stratificato che utilizzando le liste riempia 
%% delle liste di interi ordinate in modo crescente e 1)fornisca in output quella di lunghezza massima, 2) 
%% data una lista di elementi illegali, restituisca la lista di lunghezza massima 
%% tra quelle che non contengono nessun elemento illegale. 


number(1).

list([1]).

%creaLista([N]) :- number(N).
%creaLista([N1 | L]) :- number(N1) , creaListe(L).


%% creaLista([X| L]) :- number(X), %head(L,N), number(X), X<N, &incast(L,X,L).
%% len (L, N) :- creaLista(L), &length(L,N). 
%% maxList(L):- len(L,N), n=#max{x: len(_,X)}

%$ Lenght(L,N)
%% &head(L; N).
%% &head(L; N).