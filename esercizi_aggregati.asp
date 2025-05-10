% == == == == == == == == == == == == == == == == == == == == == == == == == == == 
% Compute the minimum as well as the maximum distance between nodes. 
% NOTE: distance is defined as usual.

% arc(Node1,Node2, Distance).

arc(a,b,1).
arc(b,d,1).
arc(a,c,2).
arc(c,d,1).
arc(d,e,2).
arc(c,e,1).

% Se dobbiamo per esempio trovare la distanza tra a e b, dovra essere 1.
% distanza(primo nodo, secondo nodo, distanza tra primo e secondo). 
distanza(X,Y,D) :- arc(X,Y,D). 
                                                                    %       2   1     = 3
% Se dobbiamo traovre la distanza tra a e e per esempio, dovra essere 3. a -> c -> e

distanza(X,Z,D) :- arc(X,Y,D1), distanza(Y,Z,D2), D=D1+D2.   
