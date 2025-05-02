
% Esercizio 1
% happy(P) | sad(P) :- person(P). % happy and sad are mutually exclusive 
% happy(P) :- moody(P), sad(P).
% ad(P) :- moody(P), happy(P). 

% person(ciccio).
% moody(ciccio).
 
% Esercizio 2 
% a | b.  % a and b are mutually exclusive
% a | c.  % a and c are mutually exclusive 
% b | c.  % b and c are mutually exclusive 
% :- not a. % a cannot be true 




% Esercizio 3 
happy(P) :- person(P), not sad(P).
sad(P) :- person(P), not happy(P). 

person(ciccio). 