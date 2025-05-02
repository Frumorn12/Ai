row(0..2).
col(0..8).
symbol(1..90).
 

cell(ID,X,Y,N) :- cartelle(ID), row(X), col(Y), symbol(N).
