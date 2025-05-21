card(picche, 1, 0).
card(fiori, 13, 0).
card(quadri, 5, 0).
card(cuori, 2, 0).
card(cuori, 1, 0).
card(fiori, 1, 0).
card(cuori, 12, 0).
card(cuori, 13, 0).
card(cuori, 2, 1).
card(picche, 9, 0).
card(fiori, 4, 0).
card(quadri, 12, 0).
card(cuori, 10, 0).
card(picche, 3, 0).
card(fiori, 6, 0).
card(quadri, 11, 0).
card(quadri, 11, 1).
card(cuori, 8, 0).

% X segno
% Y valore
scarto(S,V,I) | noScarto (S,V,I) :- card(S,V,I). 

countScarti(N) :- N = #count {S,V,I : scarto(S,V,I)}.
:- countScarti(N), N != 1.

% creo istanza doppione che mi crea un doppiuone per ogni carta che ha un'altra uguale di valore e segno
doppione(S,V) :- card(S,V,I), card(S,V,I1), I!=I1.  

% Regola generale per identificare una scala di tre carte consecutive dello stesso seme
scala_interna(S, V1, V2, V3) :-     
    card(S, V1, _),
    card(S, V2, _),
    card(S, V3, _),
    V2 = V1 + 1,
    V3 = V2 + 1.



% Scala con Asso all'inizio: A-2-3
scala_interna(S, 1, 2, 3) :-
    card(S, 1, _),
    card(S, 2, _),
    card(S, 3, _).

% Scala con Asso alla fine: Q-K-A (12-13-1)
scala_interna(S, 12, 13, 1) :-
    card(S, 12, _),
    card(S, 13, _),
    card(S, 1, _).

scala(S,V1):- scala_interna(S, V1, _ , _).
scala(S,V2):- scala_interna(S, _, V2 , _).
scala(S,V3):- scala_interna(S, _, _ , V3).

quasi_scala(S, V1):-
    not scala(S, V1),
    card(S, V1, _),
    card(S, V2, _),
    V2 = V1 + 1.
quasi_scala(S, V1):- 
    not scala(S, V1),
    card(S, V1, _),
    card(S, V2, _), 
    V2 = V1 + 2.
quasi_scala(S, V1):-
    not scala(S, V1),
    card(S, V1, _),
    card(S, V2, _),
    V2 = V1 - 1.
quasi_scala(S, V1):-
    not scala(S, V1),
    card(S, V1, _),
    card(S, V2, _),
    V2 = V1 - 2.
quasi_scala(S, 1):-
    not scala(S, 1),
    card(S, 1, _),
    card(S, 13, _).
quasi_scala(S, 1):-
    not scala(S, 1),
    card(S, 1, _),
    card(S, 12, _). 
quasi_scala(S, 12):-
    not scala(S, 12),
    card(S, 12, _),
    card(S, 1, _).
quasi_scala(S, 13):-    
    not scala(S, 13),
    card(S, 13, _),
    card(S, 1, _). 

quasi_tris(S,V):-
    not tris(S, V),
    card(S, V, _), 
    card(S1, V, _),
    S1 != S. 


tris_interno(S1, V1, S2, V2, S3, V3) :- card(S1, V1, _), card(S2, V2, _), card(S3, V3, _), S1 != S2, S1 != S3, S2 != S3, V1 == V2, V2== V3. 
tris(S,V) :- tris_interno(S, V, _, _, _, _).
tris(S,V) :- tris_interno(_, _, S, V, _, _).
tris(S,V) :- tris_interno(_, _, _, _, S, V).

:- scarto(S, 25, I). 

:~ doppione(S,V), scarto(S,V,I), N = V-2, V!=1, V!= 11, V!=12, V!=13. [N@2]
:~ doppione(S,1), scarto(S,1,I), N = 9. [N@2, S, 1, I]  
:~ doppione(S,11), scarto(S,11,I), N = 8. [N@2, S, 11, I] 
:~ doppione(S,12), scarto(S,12,I), N = 8. [N@2, S, 12, I] 
:~ doppione(S,13), scarto(S,13,I), N = 8. [N@2, S, 13, I] 

:~ scarto(S,V,I), not doppione(S,V), N = V-1, V!=1, V!= 11, V!=12, V!=13. [N@2]
:~ scarto(S,1,I), not doppione(S,1).[11@2, S, 1, I] 
:~ scarto(S,11,I), not doppione(S,11). [10@2, S, 11, I]
:~ scarto(S,12,I), not doppione(S,11). [10@2, S, 12, I]
:~ scarto(S,13,I), not doppione(S,11). [10@2, S, 13, I] 


:~ scarto(S,V,I), quasi_scala(S,V), N = V*2. [N@2, S, V, I] 
:~ scarto(S,V,I), scala(S,V), N = V*3. [N@2, S, V, I] 

:~ scarto(S,V,I), quasi_tris(S,V), N = V*2. [N@2, S, V, I]   
:~ scarto(S,V,I), tris(S,V), N = V*3. [N@2, S, V, I] 

