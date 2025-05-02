
usa(B, matita) | usa(B, pennello) | usa(B, pastello) | usa(B, evidenziatore) :- bambino(B).
turno (B, 1) | turno (B, 2) | turno (B, 3) | turno (B, 4) :- bambino(B).
:- turno (B1, T) , turno (B2, T) , B1 != B2.
:- usa (B1, S) , usa (B2, S) , B1 != B2.
:- usa (marcello, evidenziatore). 
:- usa (B1, pennello) , turno (B1, T) , usa(B2, matita) , turno(B2, T2+1), not #sum{T:1}=T2.
:- turno(caterina, 2).
:- usa(B,pastello), turno(B,T) , usa(cristina, S), turno(cristina,T2), not #sum{T:2}=T2. 


bambino (caterina).
bambino (marcello).
bambino (cristina).
bambino (federico).
% strumenti (pastello).
% strumenti (evidenziatore).
% strumento (matita).
% strumento (pennello).

